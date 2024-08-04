import 'dart:io';

void main() {
  print("Enter a positive number n: ");
  int n = int.parse(stdin.readLineSync()!);  

  int sum = 0;
  int i = 1;

  while (i <= n) {
    sum += i;  
    i++;  
  }

  print("The sum of numbers from 1 to $n is: $sum");
}
