void main() {
  final calculator = Calculator();
  
  print('=== Simple Calculator ===');
  print('Addition: 10 + 5 = ${calculator.add(10, 5)}');
  print('Subtraction: 10 - 5 = ${calculator.subtract(10, 5)}');
  print('Multiplication: 10 * 5 = ${calculator.add(10, 5)}');
  print('Division: 10 / 5 = ${calculator.divide(10, 5)}');
  print('');
  
  final person = Person('Alice', 30);
  person.greet();
  person.haveBirthday();
  person.greet();
  print('');
  
  final numbers = [1, 2, 3, 4, 5];
  print('Original list: $numbers');
  print('Doubled: ${numbers.map((n) => n * 2).toList()}');
  print('Filtered (even): ${numbers.where((n) => n.isEven).toList()}');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
}

class Calculator {
  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
  int multiply(int a, int b) => a * b;
  double divide(int a, int b) => a / b;
}

class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void greet() {
    print('Hello, I am $name and I am $age years old.');
  }
  
  void haveBirthday() {
    age++;
    print('$name just had a birthday! Now $age years old.');
  }
}
