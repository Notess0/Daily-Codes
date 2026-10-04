#!/usr/bin/env python3

import anthropic
import sys

def main():
    # Initialize the Anthropic client
    client = anthropic.Anthropic()
    
    # Get a question from command line or use default
    if len(sys.argv) > 1:
        user_question = " ".join(sys.argv[1:])
    else:
        user_question = "What are the top 3 benefits of using Python for data science?"
    
    print(f"Question: {user_question}\n")
    print("Response:")
    print("-" * 50)
    
    # Create a message using the Claude API
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": user_question
            }
        ]
    )
    
    # Extract and print the response
    response_text = message.content[0].text
    print(response_text)
    print("-" * 50)
    
    # Print usage information
    print(f"\nTokens used - Input: {message.usage.input_tokens}, Output: {message.usage.output_tokens}")

if __name__ == "__main__":
    main()
