#!/usr/bin/env python3.10

import anthropic
import json

def analyze_text(text: str) -> dict:
    """Analyze text using Claude API and return structured results."""
    
    client = anthropic.Anthropic()
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": f"""Analyze the following text and provide:
1. A summary (1-2 sentences)
2. Key topics (list 3-5 items)
3. Sentiment (positive, negative, or neutral)
4. Reading difficulty (easy, medium, or hard)

Text to analyze:
{text}

Please respond in JSON format with keys: summary, topics, sentiment, difficulty"""
            }
        ]
    )
    
    response_text = message.content[0].text
    
    try:
        start_idx = response_text.find('{')
        end_idx = response_text.rfind('}') + 1
        json_str = response_text[start_idx:end_idx]
        result = json.loads(json_str)
    except (json.JSONDecodeError, ValueError):
        result = {"raw_response": response_text}
    
    return result

def main():
    sample_text = """
    Python is a high-level programming language known for its simplicity and readability.
    It supports multiple programming paradigms including procedural, object-oriented, and functional programming.
    Python is widely used in web development, data science, artificial intelligence, and automation.
    The language has a large ecosystem of libraries and frameworks that make development faster and easier.
    """
    
    print("Text Analysis Tool")
    print("=" * 50)
    print(f"Analyzing text: {sample_text[:100]}...\n")
    
    results = analyze_text(sample_text)
    
    print("Analysis Results:")
    print(json.dumps(results, indent=2))

if __name__ == "__main__":
    main()
