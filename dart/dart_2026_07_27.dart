import 'package:google_generative_ai/google_generative_ai.dart';

Future<void> main() async {
  final apiKey = 'AIzaSyD_SlqU-4oueeMLXQofQWE1FqDTy-hA_50';
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: apiKey,
  );

  print('=== Gemini AI Chat Example ===\n');

  final conversationHistory = <Content>[];

  const userMessages = [
    'What is the capital of France?',
    'Tell me a fun fact about it.',
    'How many people live there?'
  ];

  for (final userMessage in userMessages) {
    print('User: $userMessage');

    conversationHistory.add(
      Content.text(userMessage),
    );

    final response = await model.generateContent(conversationHistory);

    final aiResponse = response.text ?? 'No response generated';
    print('AI: $aiResponse\n');

    conversationHistory.add(
      Content.model([TextPart(aiResponse)]),
    );
  }

  print('=== Chat Complete ===');
}
