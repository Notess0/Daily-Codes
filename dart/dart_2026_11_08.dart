import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<void> main() async {
  // Initialize the Generative AI client
  final apiKey = Platform.environment['GOOGLE_API_KEY'];
  if (apiKey == null) {
    print('Error: GOOGLE_API_KEY environment variable not set');
    exit(1);
  }

  final client = GenerativeAI(apiKey: apiKey);
  final model = client.getGenerativeModel(model: 'gemini-2.0-flash');

  // Example 1: Simple text generation
  print('=== Example 1: Simple Text Generation ===');
  final prompt1 = 'Write a short haiku about programming';
  final response1 = await model.generateContent([Content.text(prompt1)]);
  print('Prompt: $prompt1');
  print('Response: ${response1.text}\n');

  // Example 2: Multi-turn conversation
  print('=== Example 2: Multi-turn Conversation ===');
  final chat = model.startChat(history: [
    Content.text('Hello, I want to learn about Dart'),
    Content.model([TextPart('Great! Dart is a modern programming language developed by Google.')]),
  ]);

  final message = 'What are the main features of Dart?';
  print('User: $message');
  final response2 = await chat.sendMessage(Content.text(message));
  print('Assistant: ${response2.text}\n');

  // Example 3: Streaming response
  print('=== Example 3: Streaming Response ===');
  final prompt3 = 'List 3 benefits of using Dart for web development';
  print('Prompt: $prompt3');
  print('Response (streaming): ');
  
  final stream = model.generateContentStream([Content.text(prompt3)]);
  await for (final chunk in stream) {
    if (chunk.text != null) {
      stdout.write(chunk.text);
    }
  }
  print('\n');

  // Example 4: Counting tokens
  print('=== Example 4: Token Counting ===');
  final textToCount = 'Dart is a programming language optimized for building fast applications.';
  final countResponse = await model.countTokens([Content.text(textToCount)]);
  print('Text: $textToCount');
  print('Token count: ${countResponse.totalTokens}\n');

  print('All examples completed successfully!');
}
