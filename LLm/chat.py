# print("start system...........")
# import os
# import fitz  # PyMuPDF for PDF text extraction
# import faiss
# import numpy as np
# import nltk
# from nltk.tokenize import sent_tokenize
# from tkinter import Tk, filedialog
# from sentence_transformers import SentenceTransformer

# # Ensure NLTK punkt is downloaded locally beforehand.
# nltk.download('punkt')

# # Local model path (ensure the model is downloaded and placed here manually)
# model_path = "D:/MLModels/all-MiniLM-L6-v2"  # Replace with your local model path

# if not os.path.exists(model_path):
#     raise ValueError(f"Embedding model not found at {model_path}. Please place the model there.")

# # Load the local SentenceTransformer model
# model = SentenceTransformer(model_path)

# def get_pdf_paths():
#     """
#     Allow the user to upload multiple PDFs interactively.
#     """
#     pdf_paths = []
#     while True:
#         root = Tk()
#         root.withdraw()
#         pdf_path = filedialog.askopenfilename(filetypes=[("PDF files", "*.pdf")])
#         print("Upload SSuccessful ---"+pdf_path)
#         if pdf_path:
#             pdf_paths.append(pdf_path)
#             more = input("Do you want to add more PDFs? (y/n): ").strip().lower()
#             if more != 'y':
#                 break
#         else:
#             if not pdf_paths:
#                 print("No files selected.")
#             break
#     return pdf_paths

# def extract_text_with_metadata(pdf_path):
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
#         for sentence in sentences:
#             clean_sentence = sentence.strip()
#             if clean_sentence:
#                 sentence_data.append((clean_sentence, pdf_filename, page_num + 1))

#     return sentence_data

# def build_corpus_and_index(pdf_paths):
#     """
#     Build the text corpus and FAISS index from the selected PDFs.
#     """
#     corpus = []
#     metadata = []
#     for pdf_path in pdf_paths:
#         data = extract_text_with_metadata(pdf_path)
#         for sentence, filename, page in data:
#             corpus.append(sentence)
#             metadata.append((filename, page))

#     embeddings = model.encode(corpus)
#     dimension = embeddings.shape[1]
#     index = faiss.IndexFlatL2(dimension)
#     index.add(np.array(embeddings))

#     return index, corpus, metadata

# def search_answers(index, corpus, metadata, query, top_k=5):
#     """
#     Search the FAISS index for answers to the user's query.
#     """
#     query_embedding = model.encode([query])
#     distances, indices = index.search(np.array(query_embedding), k=top_k)
#     results = []
#     for dist, idx in zip(distances[0], indices[0]):
#         sentence = corpus[idx]
#         filename, page = metadata[idx]
#         results.append((sentence, filename, page, dist))
#     return results

# def summarize_results(results):
#     """
#     Provide a brief idea of the user's query by summarizing the top results.
#     """
#     if not results:
#         return "No relevant information found."
#     top_sentences = [result[0] for result in results[:3]]
#     summary = " ".join(top_sentences)
#     return f"Summary: {summary}"

# def main():
#     print("Please upload your PDF files.")
#     pdf_paths = get_pdf_paths()
#     if not pdf_paths:
#         print("No PDFs were uploaded. Exiting...")
#         return

#     print("Building the text corpus and FAISS index. Please wait...")
#     index, corpus, metadata = build_corpus_and_index(pdf_paths)
#     print("Indexing complete!")

#     while True:
#         query = input("Enter your question (or type 'exit' to quit): ")
#         if query.lower() == 'exit':
#             print("Exiting the system...")
#             break

#         results = search_answers(index, corpus, metadata, query, top_k=5)
#         if not results:
#             print("No relevant information found.")
#         else:
#             # Provide a summary of the results
#             summary = summarize_results(results)
#             print("\n--- Brief Idea ---")
#             print(summary)
#             print("------------------\n")

#             # Show detailed answers
#             print("Detailed Answers:")
#             for sentence, filename, page, dist in results:
#                 print(f"""-----------------------------
#                         Answer from Book '{filename}',
#                         Page {page}:
#                         \"{sentence}\"""")

#         another = input("\nDo you want to ask another question? (y/n): ").strip().lower()
#         if another != 'y':
#             print("Goodbye!")
#             break

# if __name__ == "__main__":
#     main()



print("start system...........")
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
            print("Upload Successful --- " + pdf_path)
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

def filter_one_per_book(results):
    """
    Given a list of (sentence, filename, page, dist) results,
    keep only one result per unique book (filename).
    We choose the one with the smallest distance (best match) for each book.
    """
    best_results = {}
    for sentence, filename, page, dist in results:
        if filename not in best_results or dist < best_results[filename][3]:
            best_results[filename] = (sentence, filename, page, dist)

    # Return a list of results from the dictionary values
    final_results = list(best_results.values())
    # Sort by distance so the best overall is first
    final_results.sort(key=lambda x: x[3])
    return final_results

def summarize_results(results):
    """
    Provide a brief idea of the user's query by summarizing the top results.
    """
    if not results:
        return "No relevant information found."
    top_sentences = [result[0] for result in results[:3]]
    summary = " ".join(top_sentences)
    return f"Summary: {summary}"

def refine_answers_with_online_system(query, results):
    """
    Placeholder function to demonstrate how one could use an external system to improve accuracy.
    For example, call an online API with the query and selected sentences to produce a refined, more accurate answer.

    This is just a stub. In a real scenario, you would:
    1. Combine the top results into a single context.
    2. Send that context and the query to a remote QA model endpoint.
    3. Parse and return the improved answer.

    Example (pseudo-code):

    context = " ".join([res[0] for res in results])
    improved_answer = call_external_api(query, context)
    return improved_answer
    """
    # For now, we just return the original summary without refinement.
    return summarize_results(results)

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
        # Filter so that only one answer per book is retained
        results = filter_one_per_book(results)

        if not results:
            print("No relevant information found.")
        else:
            # If desired, refine results with an online system:
            # summary = refine_answers_with_online_system(query, results)
            summary = summarize_results(results)

            print("\n--- Brief Idea ---")
            print(summary)
            print("------------------\n")

            # Show detailed answers (one per book)
            print("Detailed Answers:")
            for sentence, filename, page, dist in results:
                print(f"""-----------------------------
                    Answer from Book '{filename}',
                    Page {page}:
                    \"{sentence}\"""")

        another = input("\nDo you want to ask another question? (y/n): ").strip().lower()
        if another != 'y':
            print("Goodbye!")
            break

if __name__ == "__main__":
    main()
