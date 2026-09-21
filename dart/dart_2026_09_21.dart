void main() {
  final calculator = Calculator();
  
  print('=== Simple Calculator ===');
  print('Addition: 10 + 5 = ${calculator.add(10, 5)}');
  print('Subtraction: 10 - 5 = ${calculator.subtract(10, 5)}');
  print('Multiplication: 10 * 5 = ${calculator.multiply(10, 5)}');
  print('Division: 10 / 5 = ${calculator.divide(10, 5)}');
  print('Division: 10 / 3 = ${calculator.divide(10, 3).toStringAsFixed(2)}');
  
  print('\n=== List Operations ===');
  final numbers = [1, 2, 3, 4, 5];
  print('Numbers: $numbers');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
  print('Average: ${numbers.reduce((a, b) => a + b) / numbers.length}');
  
  print('\n=== String Manipulation ===');
  final text = 'Hello Dart World';
  print('Original: $text');
  print('Uppercase: ${text.toUpperCase()}');
  print('Lowercase: ${text.toLowerCase()}');
  print('Reversed: ${text.split('').reversed.join()}');
  
  print('\n=== Map Operations ===');
  final person = {'name': 'John', 'age': 30, 'city': 'New York'};
  person.forEach((key, value) {
    print('$key: $value');
  });
}

class Calculator {
  double add(num a, num b) => a + b as double;
  double subtract(num a, num b) => a - b as double;
  double multiply(num a, num b) => a * b as double;
  double divide(num a, num b) => a / b;
}
