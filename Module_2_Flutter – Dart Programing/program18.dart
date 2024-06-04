import 'dart:io';

void main() {
  print('1. Addition');
  print('2. Subtraction');
  print('3. Multiplication');
  print('4. Division');
  print('Enter your choice (1-4):');
  
  int? choice = int.tryParse(stdin.readLineSync()!);

  if (choice == null || choice < 1 || choice > 4) {
    print('Invalid choice! Please select a valid operation.');
    return;
  }

  print('Enter the first number:');
  double? num1 = double.tryParse(stdin.readLineSync()!);

  print('Enter the second number:');
  double? num2 = double.tryParse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      print('Result: ${num1! + num2!}');
      break;
    case 2:
      print('Result: ${num1! - num2!}');
      break;
    case 3:
      print('Result: ${num1! * num2!}');
      break;
    case 4:
      if (num2 == 0) {
        print('Error: Division by zero is not allowed.');
      } else {
        print('Result: ${num1! / num2!}');
      }
      break;
  }
}
