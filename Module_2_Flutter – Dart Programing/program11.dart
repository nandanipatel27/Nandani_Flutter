import 'dart:io';

void main() {
  int? year;
  print("Enter a year: ");
  year = int.parse(stdin.readLineSync()!);

  if (year % 400 == 0) {
    print("$year is a leap year.");
  }
  // not a leap year if divisible by 100
  // but not divisible by 400
  else if (year % 100 == 0) {
    print("$year is not a leap year.");
  }

  // divisible by 4
  else if (year % 4 == 0) {
    print("$year is a leap year.");
  } else {
    print("$year is a not leap year.");
  }
}
