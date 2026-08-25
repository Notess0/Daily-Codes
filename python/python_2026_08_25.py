#!/usr/bin/env python3
"""
Simple script to demonstrate Claude API usage with streaming.
"""

import anthropic


def main():
    """Main function to interact with Claude API."""
    client = anthropic.Anthropic()
    
    print("Welcome to Claude Chat!")
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
        
        print("\nClaude: ", end="", flush=True)
        
        full_response = ""
        with client.messages.stream(
            model="claude-3-5-sonnet-20241022",
            max_tokens=1024,
            messages=conversation_history,
        ) as stream:
            for text in stream.text_stream:
                print(text, end="", flush=True)
                full_response += text
        
        print("\n")
        
        conversation_history.append({
            "role": "assistant",
            "content": full_response
        })


if __name__ == "__main__":
    main()
