import anthropic


def main():
    """Simple script to interact with Claude using the Anthropic API."""
    client = anthropic.Anthropic()
    
    messages = []
    
    print("Claude Chat Bot (type 'quit' to exit)")
    print("-" * 40)
    
    system_prompt = "You are a helpful assistant. Keep responses concise and friendly."
    
    while True:
        user_input = input("\nYou: ").strip()
        
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
        
        print(f"\nClaude: {assistant_message}")


if __name__ == "__main__":
    main()
