void main() {
  final calculator = Calculator();
  
  print('=== Simple Calculator ===');
  print('Addition: ${calculator.add(10, 5)}');
  print('Subtraction: ${calculator.subtract(10, 5)}');
  print('Multiplication: ${calculator.multiply(10, 5)}');
  print('Division: ${calculator.divide(10, 5)}');
  print('');
  
  final person = Person('Alice', 30);
  print('Person: ${person.name}, Age: ${person.age}');
  print('Is Adult: ${person.isAdult()}');
  print('');
  
  final numbers = [1, 2, 3, 4, 5];
  print('Numbers: $numbers');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
  print('Average: ${numbers.reduce((a, b) => a + b) / numbers.length}');
  print('');
  
  final reversed = numbers.reversed.toList();
  print('Reversed: $reversed');
}

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) => a / b;
}

class Person {
  final String name;
  final int age;
  
  Person(this.name, this.age);
  
  bool isAdult() => age >= 18;
}
