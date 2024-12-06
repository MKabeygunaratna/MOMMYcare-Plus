from sentence_transformers import SentenceTransformer
import faiss
import numpy as np

import re

# # Input paragraph
# paragraph = """This is the first document.Here is another piece of text.Embeddings help with semantic similarity.Let's find similar text offline!."Machine learning" involves training models on data."""

# texts = re.split(r'(?<!\w)\.(?!\w)|\?|!|\n', paragraph)

# texts = [sentence.strip() for sentence in texts if sentence.strip()]

# texts = [sentence + '.' if sentence[-1].isalpha() else sentence for sentence in texts]

# print("texts = [")
# for text in texts:
#     print(f'    "{text}",')
# print("]")


model = SentenceTransformer('all-MiniLM-L6-v2')
texts = [
        "This is the first document.",
        "Here is another piece of text.",
        "Embeddings help with semantic similarity.",
        "Let's find similar text offline!",
        "Python is a versatile programming language.",
        "\"Machine learning\" involves training models on data.",
        "FAISS is useful for similarity searches.",
        "Artificial Intelligence is a rapidly growing field.",
        "This is the first document.",
        "Here is another piece of text.",
        "Embeddings help with semantic similarity.",
        "Let's find similar text offline!",
        "The quick brown fox jumps over the lazy dog.",
        "I enjoy hiking in the mountains.",
        "Natural language processing is fascinating.",
        "Machine learning models are powerful.",
        """Artificial Intelligence refers to the simulation of human intelligence in machines that are programmed to think like humans and mimic their actions.""",
        """Climate change is a significant and lasting change in the statistical distribution of weather patterns over periods ranging from decades to millions of years.""",
        """Quantum computing harnesses the phenomena of quantum mechanics to deliver a huge leap forward in computation to solve certain problems."""
    ]


print("Generating embeddings...")
embeddings = model.encode(texts)
print("Embeddings generated!")


dimension = embeddings.shape[1]
index = faiss.IndexFlatL2(dimension)
print("FAISS index initialized!")

index.add(np.array(embeddings))
print("Embeddings indexed!")

query = input("Enter :")
query_embedding = model.encode([query])


distances, indices = index.search(np.array(query_embedding), k=1)

print(f"Query: {query}")
print(f"Most similar text: {texts[indices[0][0]]} (Distance: {distances[0][0]:.4f})")

