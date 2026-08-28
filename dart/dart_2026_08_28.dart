void main() {
  print('=== Dart Script Demo ===\n');
  
  // Variables and basic operations
  String name = 'Alice';
  int age = 28;
  double height = 5.7;
  bool isStudent = false;
  
  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
  print('Is Student: $isStudent\n');
  
  // List operations
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print('Fruits: $fruits');
  fruits.add('Date');
  print('After adding Date: $fruits\n');
  
  // Map operations
  Map<String, int> scores = {
    'Math': 95,
    'English': 87,
    'Science': 92
  };
  print('Scores: $scores');
  print('Math Score: ${scores['Math']}\n');
  
  // Loop through list
  print('Fruits in uppercase:');
  for (var fruit in fruits) {
    print('  - ${fruit.toUpperCase()}');
  }
  
  // Function call
  int sum = add(10, 25);
  print('\nSum of 10 and 25: $sum');
  
  // Conditional
  if (age >= 18) {
    print('$name is an adult');
  }
}

int add(int a, int b) {
  return a + b;
}
