import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  final apiKey = Platform.environment['GOOGLE_API_KEY'];
  if (apiKey == null) {
    print('Error: GOOGLE_API_KEY environment variable not set');
    exit(1);
  }

  final model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: apiKey);

  print('Welcome to Dart AI Chat');
  print('Type "exit" to quit\n');

  final stdin = stdin;
  stdin.echoMode = true;
  stdin.lineMode = true;

  while (true) {
    stdout.write('You: ');
    final userInput = stdin.readLineSync();

    if (userInput == null || userInput.toLowerCase() == 'exit') {
      print('Goodbye!');
      break;
    }

    if (userInput.trim().isEmpty) {
      continue;
    }

    try {
      final content = [Content.text(userInput)];
      final response = await model.generateContent(content);

      if (response.text case final text?) {
        print('AI: $text\n');
      } else {
        print('AI: No response generated\n');
      }
    } catch (e) {
      print('Error: $e\n');
    }
  }
}
