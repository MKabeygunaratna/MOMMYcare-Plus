import fitz  # PyMuPDF
from nltk.tokenize import sent_tokenize
import nltk
from tkinter import Tk, filedialog
from sentence_transformers import SentenceTransformer, util
import faiss
import numpy as np
import re
import sys
import os

# Ensure that NLTK 'punkt' tokenizer is downloaded
nltk.download('punkt')

# Function to extract text from a single PDF and keep track of book and page
def extract_text_from_pdf(pdf_path):
    try:
        doc = fitz.open(pdf_path)
    except Exception as e:
        print(f"Error opening {pdf_path}: {e}")
        return []
    
    # Attempt to get the title from metadata; fallback to filename without extension
    book_name = doc.metadata.get("title")
    if not book_name:
        book_name = os.path.splitext(os.path.basename(pdf_path))[0]
    
    full_text = []
    
    # Loop through each page of the PDF
    for page_num in range(doc.page_count):
        try:
            page = doc.load_page(page_num)
            text = page.get_text()
            sentences = sent_tokenize(text)
            for sentence in sentences:
                if sentence.strip():
                    full_text.append({
                        'sentence': sentence.strip(),
                        'book': book_name,
                        'page': page_num + 1  # Pages are 1-indexed
                    })
        except Exception as e:
            print(f"Error processing page {page_num + 1} of {pdf_path}: {e}")
            continue
    
    return full_text

# Function to extract sentences from multiple PDFs
def extract_sentences_from_pdfs(pdf_paths):
    all_sentences = []
    for pdf_path in pdf_paths:
        sentences = extract_text_from_pdf(pdf_path)
        all_sentences.extend(sentences)
    return all_sentences

# Function to open file dialog and get multiple PDF paths
def get_pdf_paths():
    # Hide the Tkinter root window
    root = Tk()
    root.withdraw()  # Hide the Tkinter window
    pdf_paths = filedialog.askopenfilenames(filetypes=[("PDF files", "*.pdf")])  # Open file dialog
    return list(pdf_paths)

# Function to initialize FAISS index with cosine similarity
def initialize_faiss_index(embeddings):
    # Normalize embeddings for cosine similarity
    embeddings = embeddings / np.linalg.norm(embeddings, axis=1, keepdims=True)
    
    dimension = embeddings.shape[1]
    index = faiss.IndexFlatIP(dimension)  # Inner Product for cosine similarity
    index.add(embeddings)
    return index

# Function to encode sentences and normalize embeddings
def encode_sentences(sentences, model):
    embeddings = model.encode(sentences, convert_to_numpy=True, normalize_embeddings=True)
    return embeddings

# Function to handle querying with one answer per book
def query_system(sentences_data, model, index):
    book_set = set(item['book'] for item in sentences_data)
    num_books = len(book_set)
    
    while True:
        query = input("Enter your query (type 'add' to import more PDFs or '3' to exit): ").strip()
        if query.lower() == "3":
            print("End system.....")
            break
        elif query.lower() == "add":
            print("Adding more PDFs...")
            additional_pdfs = get_pdf_paths()
            if additional_pdfs:
                new_sentences = extract_sentences_from_pdfs(additional_pdfs)
                if new_sentences:
                    sentences_data.extend(new_sentences)
                    new_texts = [item['sentence'] for item in new_sentences]
                    new_embeddings = encode_sentences(new_texts, model)
                    index.add(new_embeddings)
                    print(f"Added {len(new_sentences)} sentences from {len(additional_pdfs)} PDFs.")
                else:
                    print("No new sentences extracted.")
            else:
                print("No files selected.")
            continue
        elif query == "":
            print("Please enter a valid query.")
            continue
        else:
            # Encode the query
            query_embedding = model.encode([query], convert_to_numpy=True, normalize_embeddings=True)
            
            # Number of results to retrieve: one per book
            k = num_books
            
            # Search for the top k similar sentences
            scores, indices = index.search(query_embedding, k)
            
            # Collect results ensuring one per book
            results = {}
            for score, idx in zip(scores[0], indices[0]):
                book = sentences_data[idx]['book']
                if book not in results:
                    results[book] = {
                        'sentence': sentences_data[idx]['sentence'],
                        'page': sentences_data[idx]['page'],
                        'score': score
                    }
                if len(results) == num_books:
                    break
            
            if not results:
                print("No similar sentences found.")
                continue
            
            print("\n----- Search Results -----")
            for i, (book, data) in enumerate(results.items(), 1):
                print(f"\nResult {i}:")
                print(f"Query - {query}")
                print(f"Similar Sentence: {data['sentence']}")
                print(f"Source Book: {book}")
                print(f"Page Number: {data['page']}")
                print(f"Similarity Score: {data['score']:.4f}")
            print("--------------------------\n")

def main():
    print("Select PDF files to import:")
    pdf_paths = get_pdf_paths()
    
    if not pdf_paths:
        print("No files selected. Exiting.")
        sys.exit()
    
    # Extract sentences from the PDFs
    sentences_data = extract_sentences_from_pdfs(pdf_paths)
    
    if not sentences_data:
        print("No sentences extracted from the selected PDFs. Exiting.")
        sys.exit()
    
    # Initialize the SentenceTransformer model
    print("Loading SentenceTransformer model...")
    model = SentenceTransformer('all-MiniLM-L6-v2')
    print("Model loaded.")
    
    # Encode sentences and initialize FAISS index
    print("Generating embeddings...")
    sentences = [item['sentence'] for item in sentences_data]
    embeddings = encode_sentences(sentences, model)
    print("Embeddings generated.")
    
    print("Initializing FAISS index with cosine similarity...")
    index = initialize_faiss_index(embeddings)
    print("FAISS index initialized and embeddings indexed.")
    
    # Start the query system
    print("\n--- Query System ---")
    print("Type your query and press Enter to search.")
    print("Type 'add' to import more PDFs.")
    print("Type '3' to exit.")
    query_system(sentences_data, model, index)

if __name__ == "__main__":
    main()
