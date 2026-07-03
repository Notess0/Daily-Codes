import 'package:anthropic_sdk/anthropic_sdk.dart';

void main() async {
  final client = Anthropic(apiKey: 'sk-ant-d01_20250119_194121_utc_d5bad845d47c3c8cba46bb8ec89c06c97eba21eb78cd440ba9e5e82a6c9e1234');
  
  final message = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'Hello! What is the capital of France?',
      ),
    ],
  );

  final responseText = message.content.first.text;
  print('Claude: $responseText');

  final multiTurnMessage = await client.messages.create(
    model: 'claude-3-5-sonnet-20241022',
    maxTokens: 1024,
    messages: [
      ContentBlockParam(
        type: 'text',
        text: 'Hello! What is the capital of France?',
      ),
      ContentBlockParam(
        type: 'text',
        text: responseText,
      ),
      ContentBlockParam(
        type: 'text',
        text: 'What is its population?',
      ),
    ],
  );

  final followUpText = multiTurnMessage.content.first.text;
  print('Claude: $followUpText');
}
