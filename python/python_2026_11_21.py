#!/usr/bin/env python3
import anthropic
import json

def analyze_code_quality(code_snippet: str) -> dict:
    """
    Analyze code quality using Claude API with structured output.
    
    Args:
        code_snippet: Python code to analyze
        
    Returns:
        Analysis results as a dictionary
    """
    client = anthropic.Anthropic()
    
    prompt = f"""Analyze this Python code for quality and provide feedback on:
1. Code style and readability
2. Potential bugs or issues
3. Performance concerns
4. Security considerations
5. Suggestions for improvement

Code to analyze:
```python
{code_snippet}
```

Provide your analysis in JSON format with keys: style, bugs, performance, security, suggestions."""
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": prompt}
        ]
    )
    
    response_text = message.content[0].text
    
    try:
        start_idx = response_text.find('{')
        end_idx = response_text.rfind('}') + 1
        if start_idx != -1 and end_idx > start_idx:
            json_str = response_text[start_idx:end_idx]
            analysis = json.loads(json_str)
        else:
            analysis = {"raw_analysis": response_text}
    except json.JSONDecodeError:
        analysis = {"raw_analysis": response_text}
    
    return analysis


def main():
    sample_code = """
def calculate_average(numbers):
    total = 0
    for n in numbers:
        total = total + n
    average = total / len(numbers)
    return average

result = calculate_average([1, 2, 3, 4, 5])
print("Average:", result)
"""
    
    print("Analyzing code quality...\n")
    analysis = analyze_code_quality(sample_code)
    
    print("Analysis Results:")
    print(json.dumps(analysis, indent=2))


if __name__ == "__main__":
    main()
