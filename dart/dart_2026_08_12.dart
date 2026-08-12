void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  print('Original list: $numbers');
  
  var evenNumbers = numbers.where((n) => n.isEven).toList();
  print('Even numbers: $evenNumbers');
  
  var squaredNumbers = numbers.map((n) => n * n).toList();
  print('Squared numbers: $squaredNumbers');
  
  var sum = numbers.reduce((a, b) => a + b);
  print('Sum of all numbers: $sum');
  
  var reversed = numbers.reversed.toList();
  print('Reversed list: $reversed');
  
  var person = {
    'name': 'John',
    'age': 30,
    'city': 'New York'
  };
  
  print('\nPerson details:');
  person.forEach((key, value) {
    print('  $key: $value');
  });
  
  var fruits = ['apple', 'banana', 'cherry', 'date'];
  var upperFruits = fruits.map((f) => f.toUpperCase()).toList();
  print('\nFruits in uppercase: $upperFruits');
  
  var double sum = numbers
    .where((n) => n > 5)
    .map((n) => n * 2)
    .reduce((a, b) => a + b);
  print('Sum of doubled numbers greater than 5: $sum');
  
  var greeting = 'Hello, Dart!';
  print('\nString length: ${greeting.length}');
  print('Contains "Dart": ${greeting.contains('Dart')}');
}
