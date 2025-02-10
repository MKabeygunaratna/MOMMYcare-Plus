import requests
import PyPDF2
import os
import faiss
import numpy as np
from sentence_transformers import SentenceTransformer

# LM Studio local server URL
url = "http://127.0.0.1:1234/v1/chat/completions"

# Initialize embedding model
embedding_model = SentenceTransformer('all-MiniLM-L6-v2')

# Vector store initialization
index = faiss.IndexFlatL2(384)  
pdf_metadata = []  

# ------------------------- PDF TEXT EXTRACTION -------------------------

def extract_text_from_pdf(pdf_path, max_tokens=3000):
   
    try:
        with open(pdf_path, "rb") as pdf_file:
            reader = PyPDF2.PdfReader(pdf_file)
            text = ""
            for page in reader.pages:
                text += page.extract_text()
                if len(text.split()) > max_tokens:
                    break
            return " ".join(text.split()[:max_tokens])
    except Exception as e:
        print(f"Error reading PDF '{pdf_path}': {e}")
        return ""

# ------------------------- TEXT CHUNKING & EMBEDDING -------------------------

def chunk_text(text, chunk_size=300):
    
    words = text.split()
    return [' '.join(words[i:i + chunk_size]) for i in range(0, len(words), chunk_size)]


def create_embeddings(chunks):
    
    embeddings = embedding_model.encode(chunks)
    return embeddings

# ------------------------- VECTOR STORAGE -------------------------

def store_embeddings(embeddings, metadata):
    
    index.add(embeddings)
    pdf_metadata.extend(metadata)

# ------------------------- RETRIEVAL FUNCTION -------------------------

def retrieve_relevant_chunks(query, top_k=5):
    
    query_embedding = embedding_model.encode([query])
    distances, indices = index.search(query_embedding, top_k)
    return [pdf_metadata[idx] for idx in indices[0]]

# ------------------------- MODEL INTERACTION -------------------------

def ask_model_question(model, context, user_question):
    
    system_prompt = (
        # f"You are an assistant who answers questions based solely on the following context:\n\n{context}"
            "You (LLM model) function as a chatbot providing assistance to a mother. you must actually generate responses strictly using the following context:\n\n{context}"
    )

    payload = {
        "model": model,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_question}
        ],
        "max_tokens": 500,
        "temperature": 0.1
    }

    response = requests.post(url, json=payload)

    if response.status_code == 200:
        return response.json()["choices"][0]["message"]["content"]
    else:
        return f"Error: {response.status_code}, {response.text}"

# ------------------------- PROCESSING MULTIPLE PDFs -------------------------

def process_multiple_pdfs(pdf_paths):
    
    for pdf_path in pdf_paths:
        if os.path.exists(pdf_path):
            print(f"Processing '{pdf_path}'...")
            extracted_text = extract_text_from_pdf(pdf_path)
            chunks = chunk_text(extracted_text)
            embeddings = create_embeddings(chunks)
            metadata = [{'chunk': chunk, 'pdf_name': os.path.basename(pdf_path)} for chunk in chunks]
            store_embeddings(embeddings, metadata)
            print(f"Successfully processed '{pdf_path}'.")
        else:
            print(f"File '{pdf_path}' not found. Skipping.")

# ------------------------- MAIN EXECUTION FLOW -------------------------

if __name__ == "__main__":
    pdf_paths = [r"C:\\Users\\isira\\Downloads\\ML-NOTES.pdf"]

    # Process PDFs and store embeddings
    process_multiple_pdfs(pdf_paths)

    if pdf_metadata:
        print("\nPDFs successfully processed. You can now ask questions!")
        model_name = "llama-3.2-1b-instruct"

        while True:
            user_question = input("\nAsk a question (or type 'exit' to quit): ")
            
            relevant_chunks = retrieve_relevant_chunks(user_question)
            context = '\n'.join([chunk['chunk'] for chunk in relevant_chunks])
            
            answer = ask_model_question(model_name, context, user_question)
            print(f"Answer: {answer}")
    else:
        print("No PDFs were successfully processed. Exiting.")
