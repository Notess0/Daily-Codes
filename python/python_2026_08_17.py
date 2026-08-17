#!/usr/bin/env python3
import anthropic
import sys


def main():
    client = anthropic.Anthropic()
    
    print("Welcome to the Python Chat Assistant!")
    print("Type 'quit' to exit.\n")
    
    conversation_history = []
    
    while True:
        user_input = input("You: ").strip()
        
        if user_input.lower() == 'quit':
            print("Goodbye!")
            break
        
        if not user_input:
            continue
        
        conversation_history.append({
            "role": "user",
            "content": user_input
        })
        
        response = client.messages.create(
            model="claude-3-5-sonnet-20241022",
            max_tokens=1024,
            system="You are a helpful assistant. Keep your responses concise and friendly.",
            messages=conversation_history
        )
        
        assistant_message = response.content[0].text
        
        conversation_history.append({
            "role": "assistant",
            "content": assistant_message
        })
        
        print(f"\nAssistant: {assistant_message}\n")


if __name__ == "__main__":
    main()
