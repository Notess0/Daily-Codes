void main() {
  final calculator = Calculator();
  
  print('Simple Calculator');
  print('================');
  
  print('Addition: 10 + 5 = ${calculator.add(10, 5)}');
  print('Subtraction: 10 - 5 = ${calculator.subtract(10, 5)}');
  print('Multiplication: 10 * 5 = ${calculator.multiply(10, 5)}');
  print('Division: 10 / 5 = ${calculator.divide(10, 5)}');
  
  print('\nList Operations');
  print('===============');
  
  final numbers = [1, 2, 3, 4, 5];
  print('Original list: $numbers');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
  print('Average: ${numbers.reduce((a, b) => a + b) / numbers.length}');
  print('Max: ${numbers.reduce((a, b) => a > b ? a : b)}');
  print('Min: ${numbers.reduce((a, b) => a < b ? a : b)}');
  
  print('\nString Operations');
  print('==================');
  
  final text = 'hello dart programming';
  print('Original: $text');
  print('Uppercase: ${text.toUpperCase()}');
  print('Character count: ${text.length}');
  print('Reversed: ${text.split('').reversed.join('')}');
  
  print('\nMap Operations');
  print('===============');
  
  final person = {'name': 'John', 'age': 30, 'city': 'New York'};
  person.forEach((key, value) {
    print('$key: $value');
  });
}

class Calculator {
  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
  int multiply(int a, int b) => a * b;
  double divide(int a, int b) => a / b;
}
