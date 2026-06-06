import anthropic
import json
from datetime import datetime

def get_current_time() -> str:
    """Get the current date and time."""
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

def get_weather(location: str) -> str:
    """Get weather for a location (simulated)."""
    weather_data = {
        "new york": "Rainy, 65°F",
        "london": "Cloudy, 55°F",
        "tokyo": "Sunny, 72°F",
        "sydney": "Clear, 78°F"
    }
    return weather_data.get(location.lower(), "Weather data not available")

def process_tool_call(tool_name: str, tool_input: dict) -> str:
    """Process tool calls from the assistant."""
    if tool_name == "get_current_time":
        return get_current_time()
    elif tool_name == "get_weather":
        location = tool_input.get("location", "unknown")
        return get_weather(location)
    else:
        return f"Unknown tool: {tool_name}"

def main():
    """Main function to run the AI assistant with tools."""
    client = anthropic.Anthropic()
    
    tools = [
        {
            "name": "get_current_time",
            "description": "Get the current date and time",
            "input_schema": {
                "type": "object",
                "properties": {},
                "required": []
            }
        },
        {
            "name": "get_weather",
            "description": "Get weather information for a location",
            "input_schema": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "The city or location to get weather for"
                    }
                },
                "required": ["location"]
            }
        }
    ]
    
    messages = [
        {
            "role": "user",
            "content": "What time is it now and what's the weather like in Tokyo?"
        }
    ]
    
    print("User: What time is it now and what's the weather like in Tokyo?")
    print("-" * 50)
    
    response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        tools=tools,
        messages=messages
    )
    
    while response.stop_reason == "tool_use":
        tool_use_block = next(
            (block for block in response.content if block.type == "tool_use"),
            None
        )
        
        if tool_use_block:
            tool_name = tool_use_block.name
            tool_input = tool_use_block.input
            
            print(f"Assistant using tool: {tool_name}")
            print(f"Input: {json.dumps(tool_input, indent=2)}")
            
            tool_result = process_tool_call(tool_name, tool_input)
            print(f"Tool result: {tool_result}")
            print("-" * 50)
            
            messages.append({"role": "assistant", "content": response.content})
            messages.append({
                "role": "user",
                "content": [
                    {
                        "type": "tool_result",
                        "tool_use_id": tool_use_block.id,
                        "content": tool_result
                    }
                ]
            })
            
            response = client.messages.create(
                model="claude-3-5-sonnet-20241022",
                max_tokens=1024,
                tools=tools,
                messages=messages
            )
    
    final_response = next(
        (block.text for block in response.content if hasattr(block, "text")),
        None
    )
    
    if final_response:
        print("Assistant:", final_response)

if __name__ == "__main__":
    main()
