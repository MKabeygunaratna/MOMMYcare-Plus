import requests
import PyPDF2
import os

# LM Studio local server URL
url = "http://127.0.0.1:1234/v1/chat/completions"

def extract_text_from_pdf(pdf_path, max_tokens=3000):
    """
    Extracts text from a PDF file and truncates it to a specified token limit.
    """
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

def summarize_text(long_text, max_sentences=10):
    """
    Summarizes the given text to the specified number of sentences.
    """
    sentences = long_text.split('. ')
    return '. '.join(sentences[:max_sentences]) + ('.' if len(sentences) > max_sentences else '')

def chunk_text(text, chunk_size=3000):
    """
    Splits text into chunks of specified token size.
    """
    words = text.split()
    return [' '.join(words[i:i + chunk_size]) for i in range(0, len(words), chunk_size)]

def ask_model_question(model, extracted_text, user_question):
    """
    Sends a user question along with PDF content to the model and retrieves the response.
    """
    system_prompt = (
        f"You are an assistant who answers questions based solely on the following PDF content:\n\n{extracted_text}"
    )

    payload = {
        "model": model,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_question}
        ],
        "max_tokens": 500,
        "temperature": 0.7
    }

    response = requests.post(url, json=payload)

    if response.status_code == 200:
        return response.json()["choices"][0]["message"]["content"]
    else:
        return f"Error: {response.status_code}, {response.text}"

def process_multiple_pdfs(pdf_paths):
    """
    Processes multiple PDFs and stores their extracted text.
    """
    pdf_texts = {}
    for pdf_path in pdf_paths:
        if os.path.exists(pdf_path):
            print(f"Processing '{pdf_path}'...")
            extracted_text = extract_text_from_pdf(pdf_path)
            summarized_text = summarize_text(extracted_text)  # Optional summarization
            pdf_texts[os.path.basename(pdf_path)] = summarized_text
            print(f"Successfully processed '{pdf_path}'.")
        else:
            print(f"File '{pdf_path}' not found. Skipping.")
    return pdf_texts

if __name__ == "__main__":
    
    # Example: List of PDFs (Modify these paths or allow user input for multiple paths)
    # pdf_paths = [
    #     r"C:\Users\Isira Weerasinghe\Desktop\PDF1.pdf",
    #     r"C:\Users\Isira Weerasinghe\Desktop\PDF2.pdf",
    #     r"C:\Users\Isira Weerasinghe\Desktop\PDF3.pdf"
    # ]
    
    pdf_paths = [r"C:\Users\Isira Weerasinghe\Desktop\EDUCATION\MACHINE LEARNING(R17A0534).pdf"]
    

    # Process all PDFs and store their content
    pdf_texts = process_multiple_pdfs(pdf_paths)

    if pdf_texts:
        print("\nPDFs successfully processed. You can now ask questions!")
        model_name = "hugging-quants/Llama-3.2-1B-Instruct-Q8_0-GGUF"

        selected_pdf = None

        while True:
            # Prompt user to select a PDF or ask a question
            if not selected_pdf:
                print("\nAvailable PDFs:")
                for idx, pdf_name in enumerate(pdf_texts.keys(), 1):
                    print(f"{idx}. {pdf_name}")

                user_choice = input("Select a PDF by number (or type 'exit' to quit): ")
                if user_choice.lower() == "exit":
                    print("Goodbye!")
                    break

                if user_choice.isdigit():
                    idx = int(user_choice) - 1
                    if 0 <= idx < len(pdf_texts):
                        selected_pdf = list(pdf_texts.keys())[idx]
                        print(f"\nSelected PDF: {selected_pdf}")
                    else:
                        print("Invalid choice. Try again.")
                        continue
                else:
                    print("Invalid input. Please select by number.")
                    continue

            user_question = input(f"Ask a question about '{selected_pdf}' (type 'switch' to choose another PDF, 'exit' to quit): ")
            
            if user_question.lower() == "exit":
                print("Goodbye!")
                break
            elif user_question.lower() == "switch":
                selected_pdf = None
                continue
            
            answer = ask_model_question(model_name, pdf_texts[selected_pdf], user_question)
            print(f"Answer: {answer}")
    else:
        print("No PDFs were successfully processed. Exiting.")
