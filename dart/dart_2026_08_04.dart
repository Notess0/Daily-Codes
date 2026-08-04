void main() {
  List<int> numbers = [3, 1, 4, 1, 5, 9, 2, 6];
  print('Original list: $numbers');
  
  List<int> sorted = List.from(numbers)..sort();
  print('Sorted list: $sorted');
  
  List<int> reversed = List.from(numbers)..sort((a, b) => b.compareTo(a));
  print('Reversed sorted: $reversed');
  
  int sum = numbers.fold(0, (prev, element) => prev + element);
  print('Sum: $sum');
  
  double average = sum / numbers.length;
  print('Average: $average');
  
  int max = numbers.reduce((a, b) => a > b ? a : b);
  print('Max: $max');
  
  int min = numbers.reduce((a, b) => a < b ? a : b);
  print('Min: $min');
  
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print('Doubled: $doubled');
  
  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evens');
  
  Set<int> unique = numbers.toSet();
  print('Unique elements: $unique');
  
  Map<int, int> frequency = {};
  for (int num in numbers) {
    frequency[num] = (frequency[num] ?? 0) + 1;
  }
  print('Frequency map: $frequency');
}
