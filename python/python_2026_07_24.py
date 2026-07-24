import anthropic
import json

def main():
    client = anthropic.Anthropic()
    
    messages = [
        {
            "role": "user",
            "content": "Generate a JSON object with 3 random facts about Python programming language. Include fields: fact_number, title, and description."
        }
    ]
    
    print("Sending request to Claude API...")
    
    response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=messages
    )
    
    response_text = response.content[0].text
    print("\nRaw Response:")
    print(response_text)
    
    try:
        json_start = response_text.find('{')
        json_end = response_text.rfind('}') + 1
        
        if json_start != -1 and json_end > json_start:
            json_str = response_text[json_start:json_end]
            facts = json.loads(json_str)
            
            print("\nParsed JSON Facts:")
            print(json.dumps(facts, indent=2))
        else:
            print("\nNo valid JSON found in response")
    except json.JSONDecodeError as e:
        print(f"\nError parsing JSON: {e}")

if __name__ == "__main__":
    main()
