import os
from typing import Optional
import anthropic
from langchain_community.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from fastapi import FastAPI, UploadFile, File, HTTPException
from pydantic import BaseModel
import uvicorn

class Question(BaseModel):
    question: str

app = FastAPI()

class MotherSupportBot:
    def __init__(self):
        # Initialize Claude client
        # self.client = anthropic.Client(api_key=os.getenv("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"))
        self.client = anthropic.Client(api_key="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")

        # Store PDF contents
        self.pdf_contents = []
        
        # Text splitter for PDFs
        self.text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=1000,
            chunk_overlap=200
        )

    async def add_pdf(self, file: UploadFile):
        """Add a PDF document to the knowledge base"""
        try:
            if not file.filename.endswith('.pdf'):
                raise HTTPException(status_code=400, detail="File must be a PDF")
                
            # Save uploaded file temporarily
            temp_path = f"temp_{file.filename}"
            with open(temp_path, "wb") as f:
                content = await file.read()
                f.write(content)
            
            # Load and process PDF
            loader = PyPDFLoader(temp_path)
            pages = loader.load()
            
            # Split text into chunks
            texts = self.text_splitter.split_documents(pages)
            
            # Store the text chunks
            self.pdf_contents.extend([doc.page_content for doc in texts])
                
            # Clean up temporary file
            os.remove(temp_path)
            return {"message": f"Successfully added {file.filename} to knowledge base"}
            
        except Exception as e:
            raise HTTPException(status_code=400, detail=f"Error processing PDF: {str(e)}")

    async def ask_question(self, question: str) -> dict:
        """Answer a question based on the PDF content"""
        try:
            if not self.pdf_contents:
                return {"error": "No PDF content available. Please upload a PDF first."}

            prompt = f"""Based on the following content, please answer this question:

            Question: {question}

            Content: {' '.join(self.pdf_contents)}

            Please provide a clear and accurate answer based on the content provided."""

            response = self.client.messages.create(
                model="claude-3-sonnet-20240229",
                max_tokens=1000,
                messages=[
                    {"role": "user", "content": prompt}
                ]
            )
            
            return {"answer": response.content}

        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Error generating answer: {str(e)}")

# Initialize bot
bot = MotherSupportBot()

@app.post("/upload-pdf")
async def upload_pdf(file: UploadFile = File(...)):
    return await bot.add_pdf(file)

@app.post("/ask_question")
async def ask_question(question: Question):
    return await bot.ask_question(question.question)

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
