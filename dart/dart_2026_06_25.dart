import 'package:anthropic_sdk/anthropic_sdk.dart';

void main() async {
  final client = Anthropic();

  print('Anthropic SDK Pure Dart Example');
  print('================================\n');

  // Example 1: Simple message
  print('Example 1: Simple Message');
  print('-' * 30);
  
  final message = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'What is the capital of France?',
      ),
    ],
  );

  final response = message.content.first;
  if (response is TextBlock) {
    print('Q: What is the capital of France?');
    print('A: ${response.text}\n');
  }

  // Example 2: Multi-turn conversation
  print('Example 2: Multi-turn Conversation');
  print('-' * 30);
  
  final conversation = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'Tell me a short joke about programming.',
      ),
    ],
  );

  final jokeResponse = conversation.content.first;
  if (jokeResponse is TextBlock) {
    print('Request: Tell me a short joke about programming');
    print('Response: ${jokeResponse.text}\n');
  }

  // Example 3: System prompt
  print('Example 3: With System Prompt');
  print('-' * 30);
  
  final systemMessage = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    system: 'You are a helpful assistant that explains concepts in simple terms.',
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'Explain quantum computing in one sentence.',
      ),
    ],
  );

  final systemResponse = systemMessage.content.first;
  if (systemResponse is TextBlock) {
    print('Request: Explain quantum computing in one sentence');
    print('Response: ${systemResponse.text}\n');
  }

  print('Examples completed successfully!');
}
