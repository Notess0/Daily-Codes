#!/usr/bin/env python3.10

import anthropic
import json

def main():
    client = anthropic.Anthropic()
    
    messages = [
        {
            "role": "user",
            "content": "Generate a Python function that calculates the factorial of a number. Return only valid Python code."
        }
    ]
    
    print("Requesting Python code from Claude...")
    print("-" * 50)
    
    response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=messages
    )
    
    code_response = response.content[0].text
    print("Generated Code:")
    print(code_response)
    print("-" * 50)
    
    # Extract and execute the factorial function
    exec_globals = {}
    exec(code_response, exec_globals)
    
    # Call the factorial function
    factorial_func = exec_globals.get('factorial')
    if factorial_func:
        test_values = [5, 10, 0, 1]
        print("\nTesting the generated factorial function:")
        for n in test_values:
            try:
                result = factorial_func(n)
                print(f"factorial({n}) = {result}")
            except Exception as e:
                print(f"Error calculating factorial({n}): {e}")
    else:
        print("Could not find factorial function in generated code")
    
    print("\nSecond request: Generate a JSON structure for a person")
    print("-" * 50)
    
    messages.append({
        "role": "assistant",
        "content": code_response
    })
    
    messages.append({
        "role": "user",
        "content": "Create a JSON object representing a person with name, age, email, and a list of hobbies. Return only valid JSON."
    })
    
    json_response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=messages
    )
    
    json_str = json_response.content[0].text
    print("Generated JSON:")
    print(json_str)
    
    # Parse and pretty print the JSON
    try:
        person_data = json.loads(json_str)
        print("\nParsed JSON:")
        print(json.dumps(person_data, indent=2))
    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON: {e}")

if __name__ == "__main__":
    main()
