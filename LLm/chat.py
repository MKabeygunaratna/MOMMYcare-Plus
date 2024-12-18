# import os
# import fitz  # PyMuPDF for PDF text extraction
# import faiss
# import numpy as np
# import re
# import nltk
# from nltk.tokenize import sent_tokenize
# from tkinter import Tk, filedialog

# # Ensure NLTK punkt tokenizer is downloaded
# nltk.download('punkt')

# def get_pdf_paths():
#     """
#     Allow user to select multiple PDF files at once.
#     """
#     root = Tk()
#     root.withdraw()
#     pdf_paths = filedialog.askopenfilenames(filetypes=[("PDF files", "*.pdf")])
#     return list(pdf_paths)

# def extract_text_with_page_info(pdf_path):
#     """
#     Extract text from the given PDF and return a list of tuples:
#     [(sentence, pdf_filename, page_number), ...]
#     """
#     doc = fitz.open(pdf_path)
#     pdf_filename = os.path.basename(pdf_path)
#     sentence_data = []

#     for page_num in range(doc.page_count):
#         page = doc.load_page(page_num)
#         text = page.get_text()
#         sentences = sent_tokenize(text)
#         for s in sentences:
#             clean_s = s.strip().replace('"', r'\"')
#             if clean_s:
#                 sentence_data.append((clean_s, pdf_filename, page_num + 1))

#     return sentence_data

# def build_corpus_and_index(pdf_paths):
#     """
#     Build a corpus from multiple PDFs and create a FAISS index.
#     Returns the index and the metadata arrays.
#     """
#     corpus = []
#     metadata = []

#     for pdf_path in pdf_paths:
#         data = extract_text_with_page_info(pdf_path)
#         for (sentence, filename, page) in data:
#             corpus.append(sentence)
#             metadata.append((filename, page))

#     # Create embeddings for the corpus using simple vectorization (length of sentences)
#     embeddings = np.array([len(sentence.split()) for sentence in corpus]).reshape(-1, 1)

#     dimension = embeddings.shape[1]
#     index = faiss.IndexFlatL2(dimension)
#     index.add(embeddings)

#     return index, corpus, metadata

# def analyze_query(query):
#     """
#     Analyze the user's query and return a list of keywords for matching.
#     """
#     # Split query into words and filter out short/common ones
#     keywords = [word.lower() for word in re.findall(r'\w+', query) if len(word) > 2]
#     return keywords

# def search_answers(index, corpus, metadata, query, top_k=5):
#     """
#     Search for the most relevant sentences from the corpus based on query.
#     """
#     # Basic vector representation of the query (number of words)
#     query_length = len(query.split())
#     query_embedding = np.array([[query_length]])

#     distances, indices = index.search(query_embedding, k=top_k)
#     results = []
#     for dist, idx in zip(distances[0], indices[0]):
#         if idx < len(corpus):
#             sentence = corpus[idx]
#             filename, page = metadata[idx]
#             results.append((sentence, filename, page, dist))
#     return results

# def format_results(results):
#     """
#     Format the results into a brief response for the user.
#     """
#     response = []
#     for (sentence, filename, page, dist) in results:
#         response.append(f"From '{filename}', Page {page}: \"{sentence}\"")
#     return response

# def main():
#     print("Please select your PDF files (you can select multiple at once).")
#     pdf_paths = get_pdf_paths()
#     if not pdf_paths:
#         print("No PDFs were selected. Exiting...")
#         return

#     print("Processing PDFs and building index...")
#     index, corpus, metadata = build_corpus_and_index(pdf_paths)
#     print("Indexing complete!")

#     while True:
#         query = input("Enter your question (or type 'exit' to quit): ")
#         if query.lower() == 'exit':
#             print("Exiting the system...")
#             break

#         # Analyze the query and retrieve relevant answers
#         keywords = analyze_query(query)
#         results = search_answers(index, corpus, metadata, query, top_k=5)

#         if not results:
#             print("No relevant information found.")
#             continue

#         print("\n--- Results ---")
#         formatted_results = format_results(results)
#         for result in formatted_results:
#             print(result)
#         print("---------------\n")

#         another = input("Do you want to ask another question? (y/n): ").strip().lower()
#         if another != 'y':
#             print("End system.....")
#             break

# if __name__ == "__main__":
#     main()





import os
import fitz  # PyMuPDF for PDF text extraction
import faiss
import numpy as np
import nltk
from nltk.tokenize import sent_tokenize
from tkinter import Tk, filedialog
from sentence_transformers import SentenceTransformer

# Ensure NLTK punkt is downloaded locally beforehand.
nltk.download('punkt')

# Local model path (ensure the model is downloaded and placed here manually)
model_path = "D:/MLModels/all-MiniLM-L6-v2"  # Replace with your local model path

if not os.path.exists(model_path):
    raise ValueError(f"Embedding model not found at {model_path}. Please place the model there.")

# Load the local SentenceTransformer model
model = SentenceTransformer(model_path)

def get_pdf_paths():
    """
    Allow the user to upload multiple PDFs interactively.
    """
    pdf_paths = []
    while True:
        root = Tk()
        root.withdraw()
        pdf_path = filedialog.askopenfilename(filetypes=[("PDF files", "*.pdf")])
        if pdf_path:
            pdf_paths.append(pdf_path)
            more = input("Do you want to add more PDFs? (y/n): ").strip().lower()
            if more != 'y':
                break
        else:
            if not pdf_paths:
                print("No files selected.")
            break
    return pdf_paths

def extract_text_with_metadata(pdf_path):
    """
    Extract text from the given PDF and return a list of tuples:
    [(sentence, pdf_filename, page_number), ...]
    """
    doc = fitz.open(pdf_path)
    pdf_filename = os.path.basename(pdf_path)
    sentence_data = []

    for page_num in range(doc.page_count):
        page = doc.load_page(page_num)
        text = page.get_text()
        sentences = sent_tokenize(text)
        for sentence in sentences:
            clean_sentence = sentence.strip()
            if clean_sentence:
                sentence_data.append((clean_sentence, pdf_filename, page_num + 1))

    return sentence_data

def build_corpus_and_index(pdf_paths):
    """
    Build the text corpus and FAISS index from the selected PDFs.
    """
    corpus = []
    metadata = []
    for pdf_path in pdf_paths:
        data = extract_text_with_metadata(pdf_path)
        for sentence, filename, page in data:
            corpus.append(sentence)
            metadata.append((filename, page))

    embeddings = model.encode(corpus)
    dimension = embeddings.shape[1]
    index = faiss.IndexFlatL2(dimension)
    index.add(np.array(embeddings))

    return index, corpus, metadata

def search_answers(index, corpus, metadata, query, top_k=5):
    """
    Search the FAISS index for answers to the user's query.
    """
    query_embedding = model.encode([query])
    distances, indices = index.search(np.array(query_embedding), k=top_k)
    results = []
    for dist, idx in zip(distances[0], indices[0]):
        sentence = corpus[idx]
        filename, page = metadata[idx]
        results.append((sentence, filename, page, dist))
    return results

def summarize_results(results):
    """
    Provide a brief idea of the user's query by summarizing the top results.
    """
    if not results:
        return "No relevant information found."
    top_sentences = [result[0] for result in results[:3]]
    summary = " ".join(top_sentences)
    return f"Summary: {summary}"

def main():
    print("Please upload your PDF files.")
    pdf_paths = get_pdf_paths()
    if not pdf_paths:
        print("No PDFs were uploaded. Exiting...")
        return

    print("Building the text corpus and FAISS index. Please wait...")
    index, corpus, metadata = build_corpus_and_index(pdf_paths)
    print("Indexing complete!")

    while True:
        query = input("Enter your question (or type 'exit' to quit): ")
        if query.lower() == 'exit':
            print("Exiting the system...")
            break

        results = search_answers(index, corpus, metadata, query, top_k=5)
        if not results:
            print("No relevant information found.")
        else:
            # Provide a summary of the results
            summary = summarize_results(results)
            print("\n--- Brief Idea ---")
            print(summary)
            print("------------------\n")

            # Show detailed answers
            print("Detailed Answers:")
            for sentence, filename, page, dist in results:
                print(f"Answer from Book '{filename}', Page {page}: \"{sentence}\"")

        another = input("\nDo you want to ask another question? (y/n): ").strip().lower()
        if another != 'y':
            print("Goodbye!")
            break

if __name__ == "__main__":
    main()
