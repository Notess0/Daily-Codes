#!/usr/bin/env python3
import anthropic
import json

def main():
    client = anthropic.Anthropic()
    
    # Example data to analyze
    sample_data = {
        "products": [
            {"id": 1, "name": "Laptop", "price": 999.99, "stock": 15},
            {"id": 2, "name": "Mouse", "price": 29.99, "stock": 150},
            {"id": 3, "name": "Keyboard", "price": 79.99, "stock": 45},
            {"id": 4, "name": "Monitor", "price": 299.99, "stock": 8},
            {"id": 5, "name": "Webcam", "price": 49.99, "stock": 200}
        ]
    }
    
    # Create a prompt that asks Claude to analyze the data
    prompt = f"""Analyze this product inventory data and provide insights:

{json.dumps(sample_data, indent=2)}

Please provide:
1. Total inventory value
2. Products with low stock (less than 50 units)
3. Average price per product
4. Top 2 most expensive items
5. Recommendations for inventory management"""

    # Call Claude API with streaming
    print("Analyzing inventory data...\n")
    print("-" * 50)
    
    with client.messages.stream(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": prompt}
        ]
    ) as stream:
        for text in stream.text_stream:
            print(text, end="", flush=True)
    
    print("\n" + "-" * 50)
    print("\nAnalysis complete!")

if __name__ == "__main__":
    main()
