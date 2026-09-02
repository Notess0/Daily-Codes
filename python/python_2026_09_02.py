import anthropic


def main():
    """Simple script that uses Claude API to analyze text."""
    client = anthropic.Anthropic()
    
    text_to_analyze = """
    The solar system consists of the Sun and all objects that orbit it.
    This includes eight planets, their moons, asteroids, and comets.
    Mercury is the closest planet to the Sun, while Neptune is the farthest.
    Earth is unique because it's the only known planet with life.
    The asteroid belt lies between Mars and Jupiter.
    """
    
    print("Original Text:")
    print(text_to_analyze)
    print("\n" + "="*50 + "\n")
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": f"Please summarize the following text in 2-3 sentences:\n\n{text_to_analyze}"
            }
        ]
    )
    
    print("Summary from Claude:")
    print(message.content[0].text)
    print("\n" + "="*50 + "\n")
    
    message = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": f"Extract 3 key facts from this text:\n\n{text_to_analyze}"
            }
        ]
    )
    
    print("Key Facts:")
    print(message.content[0].text)


if __name__ == "__main__":
    main()
