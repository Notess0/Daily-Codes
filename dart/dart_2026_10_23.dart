import 'package:anthropic_sdk/anthropic_sdk.dart';

void main() async {
  final client = Anthropic(apiKey: 'your-api-key');

  final message = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'Explain what machine learning is in 2-3 sentences.',
      )
    ],
  );

  print('Claude Response:');
  print('===============');

  for (final block in message.content) {
    if (block.type == 'text') {
      print(block.text);
    }
  }

  print('\nUsage Statistics:');
  print('Input tokens: ${message.usage.inputTokens}');
  print('Output tokens: ${message.usage.outputTokens}');
}
