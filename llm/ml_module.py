import os
import faiss
import numpy as np
import PyPDF2
from sentence_transformers import SentenceTransformer
import requests

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
    return embedding_model.encode(chunks)

# ------------------------- VECTOR STORAGE -------------------------

def store_embeddings(embeddings, metadata):
    index.add(embeddings)
    pdf_metadata.extend(metadata)

# ------------------------- RETRIEVAL FUNCTION -------------------------

def retrieve_relevant_chunks(query, top_k=5):
    query_embedding = embedding_model.encode([query])
    distances, indices = index.search(query_embedding, top_k)
    return [pdf_metadata[idx] for idx in indices[0] if idx < len(pdf_metadata)]

# ------------------------- MODEL INTERACTION -------------------------

def ask_model_question(model, context, user_question):
    system_prompt = (
        "You (LLM model) function as a chatbot providing assistance to a mother. You must generate responses strictly using the following context:\n\n{context}"
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
            extracted_text = extract_text_from_pdf(pdf_path)
            chunks = chunk_text(extracted_text)
            embeddings = create_embeddings(chunks)
            metadata = [{'chunk': chunk, 'pdf_name': os.path.basename(pdf_path)} for chunk in chunks]
            store_embeddings(embeddings, metadata)
        else:
            raise FileNotFoundError(f"File '{pdf_path}' not found")

