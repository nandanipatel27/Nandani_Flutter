import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);  

  int factorial = 1;
  int i = 1;

  while (i <= n) {
    factorial = factorial*i;  
    i++;  
  }

  print("The factorial of $n is: $factorial");
}
