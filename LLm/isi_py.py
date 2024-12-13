import fitz  # PyMuPDF
from nltk.tokenize import sent_tokenize
import nltk
from tkinter import Tk, filedialog

# Ensure that NLTK 'punkt' tokenizer is downloaded
nltk.download('punkt')

# Function to extract text from the PDF
def extract_text_from_pdf(pdf_path):
    doc = fitz.open(pdf_path)
    full_text = ""

    # Loop through each page of the PDF
    for page_num in range(doc.page_count):
        page = doc.load_page(page_num)
        full_text += page.get_text()

    return full_text

# Function to extract sentences from the text
def extract_sentences_from_text(text):
    sentences = sent_tokenize(text)
    paragraph = ' '.join(sentences)
    return paragraph

# Function to open file dialog and get the PDF path
def get_pdf_path():
    # Hide the Tkinter root window
    root = Tk()
    root.withdraw()  # Hide the Tkinter window
    pdf_path = filedialog.askopenfilename(filetypes=[("PDF files", "*.pdf")])  # Open file dialog
    return pdf_path

# Get PDF path via file dialog
pdf_path = get_pdf_path()

if pdf_path:  # If a file was selected
    # Extract text from the PDF
    pdf_text = extract_text_from_pdf(pdf_path)

    # Extract and print all sentences as a paragraph
    paragraph = extract_sentences_from_text(pdf_text)
    print(paragraph)
else:
    print("No file selected.")







from sentence_transformers import SentenceTransformer
import faiss
import numpy as np
import re

# # Input paragraph
# paragraph = input("input paragraph :")
texts_list = re.split(r'(?<=[.?!])\s*', paragraph)
texts_list = [sentence.strip().replace('"', r'\"') for sentence in texts_list if sentence.strip()]

# Format and print texts
texts = "texts = [\n"
for i, text in enumerate(texts_list):
    if i == len(texts_list) - 1:
        texts += f'    "{text}"\n'
    else:
        texts += f'    "{text}",\n'
texts += "]"

print(texts)


def Sysytem():

        model = SentenceTransformer('all-MiniLM-L6-v2')

        # print("Generating embeddings...")
# Use texts_list (the actual list of sentences) instead of the formatted string
        embeddings = model.encode(texts_list)
        # print("Embeddings generated!")

# Initialize FAISS
        dimension = embeddings.shape[1]
        index = faiss.IndexFlatL2(dimension)
        # print("FAISS index initialized!")

# Add embeddings to the index
        index.add(np.array(embeddings))
        # print("Embeddings indexed!")

# Query for similarity
        query = input("Enter your query: ")
        query_embedding = model.encode([query])

# Search for the most similar text
        distances, indices = index.search(np.array(query_embedding), k=1)

        # print(f"Query: {query}")
        print(f"Most similar text: {texts_list[indices[0][0]]} (Distance: {distances[0][0]:.4f})")


while True:
    i = input("Exit (3): ")
    if i == "3":
        print("End system.....")
        break
    else:
        Sysytem()



