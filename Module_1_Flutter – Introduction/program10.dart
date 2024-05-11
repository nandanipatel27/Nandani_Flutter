import 'dart:io';
void main() {
  int? num;

    print("enter number: ");
    num = int.parse(stdin.readLineSync()!);

    if (num < 0) {
      print('negative');
    } else {
      print('Positive');
    }
  }



