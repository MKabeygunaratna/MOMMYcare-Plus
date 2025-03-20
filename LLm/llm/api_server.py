from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
from ml_module import process_multiple_pdfs, retrieve_relevant_chunks, ask_model_question, pdf_metadata

# Initialize FastAPI
app = FastAPI()

class PDFRequest(BaseModel):
    pdf_paths: List[str]

class QueryRequest(BaseModel):
    question: str

@app.post("/upload_pdfs/")
def upload_pdfs(request: PDFRequest):
    try:
        process_multiple_pdfs(request.pdf_paths)
        return {"message": "PDFs processed successfully!"}
    except FileNotFoundError as e:
        raise HTTPException(status_code=404, detail=str(e))

@app.post("/ask_question/")
def ask_question(request: QueryRequest):
    if not pdf_metadata:
        raise HTTPException(status_code=400, detail="No PDFs processed yet. Upload PDFs first.")
    
    relevant_chunks = retrieve_relevant_chunks(request.question)
    context = '\n'.join([chunk['chunk'] for chunk in relevant_chunks])
    model_name = "llama-3.2-1b-instruct"
    
    answer = ask_model_question(model_name, context, request.question)
    return {"answer": answer}