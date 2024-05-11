import 'dart:io';

void main() {
  int m1;
  int m2;
  int m3;
  int m4;
  int m5;

  print("Enter marks for subject1: ");
  m1 = int.parse(stdin.readLineSync()!);
  print("Enter marks for subject2: ");
  m2 = int.parse(stdin.readLineSync()!);
  print("Enter marks for subject3: ");
  m3 = int.parse(stdin.readLineSync()!);
  print("Enter marks for subject4: ");
  m4 = int.parse(stdin.readLineSync()!);
  print("Enter marks for subject5: ");
  m5 = int.parse(stdin.readLineSync()!);

  var percentage = (m1 + m2 + m3 + m4 + m5) / 5;
  print("Percentage: $percentage");
}