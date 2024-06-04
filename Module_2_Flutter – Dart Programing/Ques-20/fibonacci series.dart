import 'dart:io';

void main() {
  int n1 = 0, n2 = 1;
  print("Enter number: ");
  int num = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= num; i++) {
    print(n1);
    int tmp = n1 + n2;
    n1 = n2;
    n2 = tmp;
  }
}
