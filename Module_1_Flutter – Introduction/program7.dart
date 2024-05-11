import 'dart:io';

void main() {
  int cel;
  print("Enter temperature: ");
  cel = int.parse(stdin.readLineSync()!);
  var f = (cel * 9 / 5) + 32;
  print('degree cel to fahrenheit: $f ');
}
