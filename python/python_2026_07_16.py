import anthropic

def main():
    client = anthropic.Anthropic()
    
    conversation_history = []
    
    system_prompt = """You are a helpful AI assistant. You have access to the following tools:
- calculator: Performs basic math operations (add, subtract, multiply, divide)
- weather: Gets current weather information for a location
- search: Searches the internet for information

Be concise and helpful in your responses."""
    
    print("Multi-turn Conversation with Claude")
    print("=" * 50)
    print("Type 'quit' to exit the conversation\n")
    
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
            system=system_prompt,
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
