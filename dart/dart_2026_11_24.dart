void main() {
  print('=== Simple Dart Script ===\n');
  
  // Variables and basic operations
  String name = 'Dart';
  int year = 2024;
  double version = 3.1;
  
  print('Language: $name');
  print('Year: $year');
  print('Version: $version\n');
  
  // List operations
  List<int> numbers = [1, 2, 3, 4, 5];
  print('Numbers: $numbers');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
  print('Filtered (>2): ${numbers.where((n) => n > 2).toList()}\n');
  
  // Map operations
  Map<String, int> scores = {
    'Alice': 95,
    'Bob': 87,
    'Charlie': 92
  };
  
  print('Scores:');
  scores.forEach((name, score) {
    print('  $name: $score');
  });
  
  // String operations
  String message = 'Hello, Dart!';
  print('\nOriginal: $message');
  print('Uppercase: ${message.toUpperCase()}');
  print('Length: ${message.length}');
  
  // Loop and conditional
  print('\nCounting down from 5:');
  for (int i = 5; i > 0; i--) {
    if (i % 2 == 0) {
      print('  $i - even');
    } else {
      print('  $i - odd');
    }
  }
  
  print('\n=== Script Complete ===');
}
