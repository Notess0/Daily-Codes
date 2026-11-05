import anthropic
import json
from datetime import datetime


def create_weather_report():
    client = anthropic.Anthropic()
    
    current_date = datetime.now().strftime("%Y-%m-%d")
    
    tools = [
        {
            "name": "get_weather",
            "description": "Get current weather conditions for a specified location",
            "input_schema": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "City name or location"
                    }
                },
                "required": ["location"]
            }
        },
        {
            "name": "format_report",
            "description": "Format weather data into a readable report",
            "input_schema": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "Location name"
                    },
                    "temperature": {
                        "type": "number",
                        "description": "Temperature in Fahrenheit"
                    },
                    "condition": {
                        "type": "string",
                        "description": "Weather condition"
                    }
                },
                "required": ["location", "temperature", "condition"]
            }
        }
    ]
    
    messages = [
        {
            "role": "user",
            "content": f"Create a weather report for New York for {current_date}. Get the weather data and format it into a nice report."
        }
    ]
    
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
        
        if not tool_use_block:
            break
        
        tool_name = tool_use_block.name
        tool_input = tool_use_block.input
        
        if tool_name == "get_weather":
            location = tool_input.get("location", "New York")
            tool_result = json.dumps({
                "location": location,
                "temperature": 72,
                "condition": "Partly Cloudy",
                "humidity": 65,
                "wind_speed": 10
            })
        elif tool_name == "format_report":
            location = tool_input.get("location", "New York")
            temperature = tool_input.get("temperature", 72)
            condition = tool_input.get("condition", "Partly Cloudy")
            tool_result = f"Weather Report for {location}\n" \
                         f"Temperature: {temperature}°F\n" \
                         f"Condition: {condition}\n" \
                         f"Date: {current_date}"
        else:
            tool_result = "Tool not found"
        
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
        "No response generated"
    )
    
    print("Weather Report Generated:")
    print(final_response)


if __name__ == "__main__":
    create_weather_report()
