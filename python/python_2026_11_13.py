import anthropic
import json

def main():
    client = anthropic.Anthropic()
    
    messages = [
        {
            "role": "user",
            "content": "Create a JSON object with 3 programming languages and their key features."
        }
    ]
    
    response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=messages
    )
    
    response_text = response.content[0].text
    print("Claude's response:")
    print(response_text)
    
    json_start = response_text.find('{')
    json_end = response_text.rfind('}') + 1
    
    if json_start != -1 and json_end > json_start:
        json_str = response_text[json_start:json_end]
        parsed_json = json.loads(json_str)
        print("\nParsed JSON:")
        print(json.dumps(parsed_json, indent=2))
        
        print("\nLanguages listed:")
        for lang, features in parsed_json.items():
            print(f"- {lang}: {', '.join(features) if isinstance(features, list) else features}")
    else:
        print("\nCould not extract JSON from response")

if __name__ == "__main__":
    main()
