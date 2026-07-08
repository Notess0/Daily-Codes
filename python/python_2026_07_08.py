import anthropic


def generate_python_script():
    """Generate a simple Python script using Claude API."""
    client = anthropic.Anthropic()
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": "Generate a simple Python 3.10 script that calculates the factorial of a number using recursion. Include input validation and error handling. The script should be between 20-30 lines of code."
            }
        ]
    )
    
    response_text = message.content[0].text
    print("Generated Script:")
    print("-" * 50)
    print(response_text)
    print("-" * 50)
    
    lines = response_text.strip().split('\n')
    code_lines = [line for line in lines if line.strip() and not line.strip().startswith('#')]
    print(f"\nGenerated script has {len(code_lines)} lines of code")
    
    return response_text


def main():
    """Main function to run the script generator."""
    print("Python Script Generator using Claude API")
    print("=" * 50)
    
    script = generate_python_script()
    
    print("\nScript generation completed successfully!")


if __name__ == "__main__":
    main()
