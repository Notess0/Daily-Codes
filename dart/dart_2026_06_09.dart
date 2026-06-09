import 'package:anthropic_sdk/anthropic_sdk.dart';

void main() async {
  final client = Anthropic();

  print('Welcome to the Dart Anthropic CLI!');
  print('Ask a question (type "exit" to quit):\n');

  while (true) {
    stdout.write('You: ');
    final input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print('Goodbye!');
      break;
    }

    if (input.trim().isEmpty) {
      continue;
    }

    try {
      print('\nAssistant: ');
      final stream = await client.messages.stream(
        model: 'claude-3-5-sonnet-20241022',
        maxTokens: 1024,
        messages: [
          MessageParam(
            role: Role.user,
            content: input,
          ),
        ],
      );

      await for (final event in stream) {
        if (event is ContentBlockDeltaEvent) {
          if (event.delta is TextDelta) {
            stdout.write((event.delta as TextDelta).text);
          }
        }
      }

      print('\n');
    } catch (e) {
      print('Error: $e\n');
    }
  }
}

import 'dart:io';
