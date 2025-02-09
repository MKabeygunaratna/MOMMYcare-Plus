import os
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langchain_community.document_loaders import PyPDFLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_chroma import Chroma
from langchain_core.prompts import ChatPromptTemplate
from langchain.chains import create_retrieval_chain
from langchain.chains.combine_documents import create_stuff_documents_chain

# Set OpenAI API key
os.environ['OPENAI_API_KEY'] = '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'

# Initialize the ChatOpenAI model
llm = ChatOpenAI(
    model="gpt-3.5-turbo",
    temperature=0
)

# Initialize the embedding model
embedding_model = OpenAIEmbeddings(model="text-embedding-3-small")

# Load the PDF document
loader = PyPDFLoader("path_to_your_pdf/codeprolk.pdf")  # Replace with your PDF path
docs = loader.load()

# Initialize the text splitter
text_splitter = RecursiveCharacterTextSplitter(chunk_size=400, chunk_overlap=50)

# Split the documents into chunks
splits = text_splitter.split_documents(docs)

# Create a vector store from the document chunks
vectorstore = Chroma.from_documents(documents=splits, embedding=embedding_model)

# Create a retriever from the vector store
retriever = vectorstore.as_retriever()

# Define the system prompt
system_prompt = (
    "You are an intelligent chatbot. Use the following context to answer the question. "
    "If you don't know the answer, just say that you don't know.\n\n{context}"
)

# Create the prompt template
prompt = ChatPromptTemplate.from_messages(
    [
        ("system", system_prompt),
        ("human", "{input}"),
    ]
)

# Create the question-answering chain
qa_chain = create_stuff_documents_chain(llm, prompt)

# Create the RAG chain
rag_chain = create_retrieval_chain(retriever, qa_chain)

# Query the RAG chain
response = rag_chain.invoke({"input": "who is codeprolk"})

# Print the answer
print(response["answer"])
