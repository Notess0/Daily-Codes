import anthropic
import json

def analyze_code(code_snippet: str) -> dict:
    """Analyze a code snippet using Claude and return structured feedback."""
    client = anthropic.Anthropic()
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": f"""Analyze this Python code snippet and provide feedback in JSON format with these keys:
- complexity: "low", "medium", or "high"
- issues: list of any issues found
- improvements: list of suggested improvements
- summary: brief summary of what the code does

Code to analyze:
```python
{code_snippet}
```

Respond with only valid JSON, no markdown formatting."""
            }
        ]
    )
    
    response_text = message.content[0].text
    analysis = json.loads(response_text)
    return analysis

def main():
    test_code = """
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

result = fibonacci(10)
print(result)
"""
    
    print("Analyzing code snippet...")
    print("Code to analyze:")
    print(test_code)
    print("\n" + "="*50 + "\n")
    
    analysis = analyze_code(test_code)
    
    print("Analysis Results:")
    print(f"Complexity: {analysis.get('complexity', 'N/A')}")
    print(f"\nSummary: {analysis.get('summary', 'N/A')}")
    
    print(f"\nIssues found:")
    for issue in analysis.get('issues', []):
        print(f"  - {issue}")
    
    print(f"\nSuggested improvements:")
    for improvement in analysis.get('improvements', []):
        print(f"  - {improvement}")

if __name__ == "__main__":
    main()
