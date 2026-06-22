#!/usr/bin/env python3
import anthropic
import json

def analyze_text(text: str) -> dict:
    """Analyze text using Claude API with structured output."""
    client = anthropic.Anthropic()
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": f"Analyze the following text and provide: sentiment (positive/negative/neutral), key topics (list), and summary (1-2 sentences). Text: {text}"
            }
        ]
    )
    
    response_text = message.content[0].text
    
    result = {
        "original_text": text,
        "analysis": response_text,
        "tokens_used": message.usage.input_tokens + message.usage.output_tokens
    }
    
    return result

def main():
    sample_texts = [
        "I absolutely loved the new restaurant! The food was delicious and the service was excellent.",
        "The weather today is quite pleasant with sunny skies and mild temperatures.",
        "Unfortunately, the movie was boring and I fell asleep halfway through it."
    ]
    
    print("Text Analysis using Claude API\n" + "="*40)
    
    for i, text in enumerate(sample_texts, 1):
        print(f"\nAnalysis {i}:")
        print(f"Text: {text[:50]}...")
        
        result = analyze_text(text)
        
        print(f"Analysis: {result['analysis']}")
        print(f"Tokens used: {result['tokens_used']}")
        print("-" * 40)

if __name__ == "__main__":
    main()
