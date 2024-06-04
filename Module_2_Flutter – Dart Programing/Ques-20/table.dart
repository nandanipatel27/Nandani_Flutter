import 'dart:io';

void main() {
  int x;
  int t;
  print("Enter the number: ");
  x = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= 10; i++) {
    t = x * i;
    print(" $x X $i = $t");
  }
}
