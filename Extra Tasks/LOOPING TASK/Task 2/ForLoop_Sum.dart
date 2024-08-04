//Using a for loop: Calculate and print the sum of numbers from 1 to n.

import 'dart:io';

void main() {
  print("Enter the number: ");
  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  print("Sum : ${sum}");
}
