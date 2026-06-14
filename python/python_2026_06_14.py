#!/usr/bin/env python3
"""Simple script to interact with Claude API using tool use."""

import anthropic
import json

def get_weather(location: str, unit: str = "celsius") -> dict:
    """Simulated weather API function."""
    weather_data = {
        "New York": {"temperature": 15, "condition": "Cloudy", "humidity": 65},
        "London": {"temperature": 12, "condition": "Rainy", "humidity": 80},
        "Tokyo": {"temperature": 22, "condition": "Sunny", "humidity": 55},
        "Paris": {"temperature": 14, "condition": "Partly Cloudy", "humidity": 70},
    }
    
    location_key = next((k for k in weather_data if k.lower() == location.lower()), None)
    if not location_key:
        return {"error": f"Weather data for {location} not found"}
    
    data = weather_data[location_key]
    if unit == "fahrenheit":
        data["temperature"] = int(data["temperature"] * 9/5 + 32)
    
    return {
        "location": location_key,
        "temperature": data["temperature"],
        "unit": unit,
        "condition": data["condition"],
        "humidity": data["humidity"]
    }

def process_tool_call(tool_name: str, tool_input: dict) -> str:
    """Process tool calls and return results."""
    if tool_name == "get_weather":
        result = get_weather(
            location=tool_input["location"],
            unit=tool_input.get("unit", "celsius")
        )
        return json.dumps(result)
    return json.dumps({"error": f"Unknown tool: {tool_name}"})

def main():
    """Main function to run the Claude API interaction."""
    client = anthropic.Anthropic()
    
    tools = [
        {
            "name": "get_weather",
            "description": "Get the current weather for a specific location",
            "input_schema": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "The city name to get weather for"
                    },
                    "unit": {
                        "type": "string",
                        "enum": ["celsius", "fahrenheit"],
                        "description": "Temperature unit (default: celsius)"
                    }
                },
                "required": ["location"]
            }
        }
    ]
    
    messages = [
        {"role": "user", "content": "What's the weather in New York and Paris? Please use Fahrenheit for New York."}
    ]
    
    print("User: What's the weather in New York and Paris? Please use Fahrenheit for New York.")
    print("\n" + "="*50 + "\n")
    
    response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1024,
        tools=tools,
        messages=messages
    )
    
    while response.stop_reason == "tool_use":
        tool_results = []
        
        for content_block in response.content:
            if content_block.type == "tool_use":
                tool_name = content_block.name
                tool_input = content_block.input
                tool_use_id = content_block.id
                
                print(f"Claude is using tool: {tool_name}")
                print(f"Tool input: {json.dumps(tool_input, indent=2)}")
                
                tool_result = process_tool_call(tool_name, tool_input)
                print(f"Tool result: {tool_result}\n")
                
                tool_results.append({
                    "type": "tool_result",
                    "tool_use_id": tool_use_id,
                    "content": tool_result
                })
        
        messages.append({"role": "assistant", "content": response.content})
        messages.append({"role": "user", "content": tool_results})
        
        response = client.messages
