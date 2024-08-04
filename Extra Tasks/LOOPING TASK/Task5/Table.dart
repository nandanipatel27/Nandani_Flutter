import 'dart:io';

void main() {
  print("Enter a number to print its multiplication table: ");
  int? n = int.parse(stdin.readLineSync()!);  

  print("Multiplication table for $n:");

  for (int i = 1; i <= 10; i++) {
    int result = n * i;  
    print("$n * $i = $result");  
  }
}

