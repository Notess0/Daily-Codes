import anthropic
import json

def process_text_with_claude(user_input: str) -> str:
    """Process user input with Claude using the messages API."""
    client = anthropic.Anthropic()
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": user_input
            }
        ]
    )
    
    return message.content[0].text


def analyze_json_data(data: dict) -> str:
    """Analyze JSON data using Claude."""
    client = anthropic.Anthropic()
    
    prompt = f"Analyze this data and provide insights: {json.dumps(data, indent=2)}"
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": prompt
            }
        ]
    )
    
    return message.content[0].text


def main():
    """Main function to demonstrate Claude API usage."""
    
    # Example 1: Simple text processing
    print("=== Text Processing Example ===")
    question = "What are the benefits of learning Python?"
    response = process_text_with_claude(question)
    print(f"Question: {question}")
    print(f"Response: {response}\n")
    
    # Example 2: JSON data analysis
    print("=== JSON Data Analysis Example ===")
    sample_data = {
        "product": "Laptop",
        "price": 999,
        "stock": 15,
        "rating": 4.5
    }
    
    analysis = analyze_json_data(sample_data)
    print(f"Data: {sample_data}")
    print(f"Analysis: {analysis}")


if __name__ == "__main__":
    main()
