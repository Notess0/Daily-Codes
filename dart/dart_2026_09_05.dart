void main() {
  print('Welcome to Dart Script!');
  
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  print('Sum of numbers: $sum');
  
  List<int> evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evenNumbers');
  
  List<int> squared = numbers.map((n) => n * n).toList();
  print('Squared numbers: $squared');
  
  Map<String, int> scores = {
    'Alice': 85,
    'Bob': 92,
    'Charlie': 78,
    'Diana': 88
  };
  
  print('\nScores:');
  scores.forEach((name, score) {
    print('$name: $score');
  });
  
  int highestScore = scores.values.reduce((a, b) => a > b ? a : b);
  print('Highest score: $highestScore');
  
  String Function(String) greet = (name) => 'Hello, $name!';
  print(greet('World'));
  
  printMultiplicationTable(5);
}

void printMultiplicationTable(int number) {
  print('\nMultiplication table for $number:');
  for (int i = 1; i <= 10; i++) {
    print('$number x $i = ${number * i}');
  }
}
