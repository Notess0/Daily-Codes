#!/usr/bin/env python3

import anthropic
import json

def main():
    client = anthropic.Anthropic()
    
    messages = []
    print("Multi-turn conversation with Claude")
    print("Type 'quit' to exit\n")
    
    system_prompt = "You are a helpful assistant that provides clear, concise answers. You can help with coding, writing, analysis, and general questions."
    
    while True:
        user_input = input("You: ").strip()
        
        if user_input.lower() == 'quit':
            print("Goodbye!")
            break
        
        if not user_input:
            continue
        
        messages.append({
            "role": "user",
            "content": user_input
        })
        
        response = client.messages.create(
            model="claude-3-5-sonnet-20241022",
            max_tokens=1024,
            system=system_prompt,
            messages=messages
        )
        
        assistant_message = response.content[0].text
        
        messages.append({
            "role": "assistant",
            "content": assistant_message
        })
        
        print(f"\nAssistant: {assistant_message}\n")
        
        if len(messages) > 20:
            messages = messages[-10:]

if __name__ == "__main__":
    main()
