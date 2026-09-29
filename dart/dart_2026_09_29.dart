import 'package:anthropic_sdk/anthropic_sdk.dart';

void main() async {
  final client = Anthropic();

  print('=== Dart Anthropic SDK Example ===\n');

  // Example 1: Simple message
  print('Example 1: Simple Message');
  print('-' * 40);

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

  if (message.content.isNotEmpty) {
    final textBlock = message.content[0];
    if (textBlock is TextBlock) {
      print('Question: What is the capital of France?');
      print('Answer: ${textBlock.text}\n');
    }
  }

  // Example 2: Multi-turn conversation
  print('Example 2: Multi-turn Conversation');
  print('-' * 40);

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

  if (conversation.content.isNotEmpty) {
    final jokeBlock = conversation.content[0];
    if (jokeBlock is TextBlock) {
      print('Request: Tell me a short joke about programming.');
      print('Response: ${jokeBlock.text}\n');
    }
  }

  // Example 3: System prompt
  print('Example 3: With System Prompt');
  print('-' * 40);

  final systemPromptMessage = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    system: 'You are a helpful Dart programming expert.',
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'How do I create a list in Dart?',
      ),
    ],
  );

  if (systemPromptMessage.content.isNotEmpty) {
    final answerBlock = systemPromptMessage.content[0];
    if (answerBlock is TextBlock) {
      print('Question: How do I create a list in Dart?');
      print('Answer: ${answerBlock.text}\n');
    }
  }

  print('Examples completed successfully!');
}
