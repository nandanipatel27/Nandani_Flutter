import 'dart:io';

void main() {
  print("Enter number: ");
  int num = int.parse(stdin.readLineSync()!);
  int f = 1;

  for (int i = 1; i <= num; i++) {
    f = f * i;
  }
  print("Factorial: $f");
}
