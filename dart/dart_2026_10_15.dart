import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  final apiKey = String.fromEnvironment('GOOGLE_API_KEY');
  if (apiKey.isEmpty) {
    print('Error: GOOGLE_API_KEY environment variable is not set');
    return;
  }

  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

  print('Welcome to the Dart Generative AI Chat!');
  print('Type "exit" to quit.\n');

  final chat = model.startChat();

  while (true) {
    stdout.write('You: ');
    final userInput = stdin.readLineSync();

    if (userInput == null || userInput.toLowerCase() == 'exit') {
      print('Goodbye!');
      break;
    }

    if (userInput.isEmpty) {
      continue;
    }

    try {
      final response = await chat.sendMessage(
        Content.text(userInput),
      );

      final text = response.text;
      if (text != null) {
        print('Assistant: $text\n');
      } else {
        print('Assistant: No response generated.\n');
      }
    } catch (e) {
      print('Error: $e\n');
    }
  }
}

import 'dart:io';
