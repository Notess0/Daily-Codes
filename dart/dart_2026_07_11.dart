void main() {
  final calculator = Calculator();
  
  print('=== Simple Calculator ===');
  print('Addition: 10 + 5 = ${calculator.add(10, 5)}');
  print('Subtraction: 10 - 5 = ${calculator.subtract(10, 5)}');
  print('Multiplication: 10 * 5 = ${calculator.multiply(10, 5)}');
  print('Division: 10 / 5 = ${calculator.divide(10, 5)}');
  print('Power: 2 ^ 8 = ${calculator.power(2, 8)}');
  
  print('\n=== String Operations ===');
  final processor = StringProcessor();
  print('Reverse: ${processor.reverse("Hello")}');
  print('Uppercase: ${processor.toUpperCase("Dart")}');
  print('Character count: ${processor.countChars("Dart Script")}');
  
  print('\n=== List Operations ===');
  final list = [5, 2, 8, 1, 9, 3];
  print('Original list: $list');
  print('Sorted: ${list..sort()}');
  print('Sum: ${list.fold<int>(0, (sum, num) => sum + num)}');
  print('Average: ${list.fold<int>(0, (sum, num) => sum + num) / list.length}');
}

class Calculator {
  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
  int multiply(int a, int b) => a * b;
  double divide(int a, int b) => a / b;
  int power(int base, int exp) => (base * (List.filled(exp - 1, base).fold(1, (a, b) => a * b))).toInt();
}

class StringProcessor {
  String reverse(String text) => text.split('').reversed.join('');
  String toUpperCase(String text) => text.toUpperCase();
  int countChars(String text) => text.replaceAll(' ', '').length;
}
