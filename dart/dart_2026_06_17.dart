import 'dart:io';

void main() {
  print('=== Simple Todo Application ===\n');
  
  List<String> todos = [];
  bool running = true;
  
  while (running) {
    print('\nOptions:');
    print('1. Add todo');
    print('2. View todos');
    print('3. Remove todo');
    print('4. Exit');
    stdout.write('Choose an option: ');
    
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        stdout.write('Enter todo: ');
        String? todo = stdin.readLineSync();
        if (todo != null && todo.isNotEmpty) {
          todos.add(todo);
          print('✓ Todo added!');
        }
        break;
        
      case '2':
        if (todos.isEmpty) {
          print('No todos yet!');
        } else {
          print('\nYour todos:');
          for (int i = 0; i < todos.length; i++) {
            print('${i + 1}. ${todos[i]}');
          }
        }
        break;
        
      case '3':
        if (todos.isEmpty) {
          print('No todos to remove!');
        } else {
          print('Enter todo number to remove:');
          String? input = stdin.readLineSync();
          int? index = int.tryParse(input ?? '');
          if (index != null && index > 0 && index <= todos.length) {
            todos.removeAt(index - 1);
            print('✓ Todo removed!');
          } else {
            print('Invalid number!');
          }
        }
        break;
        
      case '4':
        running = false;
        print('Goodbye!');
        break;
        
      default:
        print('Invalid option!');
    }
  }
}
