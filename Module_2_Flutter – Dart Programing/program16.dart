import 'dart:io';

void main() {
  int? marks;
  double? pr;
  int sum = 0;

  for (var i = 1; i <= 5; i++) {
    print("Enter the Marks: ");
    marks = int.parse(stdin.readLineSync()!);
      sum = sum + marks;
    pr = sum / 5;
      
  }

  print("Total Marks: $sum");
    print("Percentage: $pr");
  if (pr! > 75) {
    print("Distinction");
  } else if (pr > 60 && pr <= 75) {
    print("First class");
  } else if (pr > 50 && pr <= 60) {
    print("Second class");
  } else if (pr > 35 && pr < 50) {
    print("Pass class");
  } else {
    print("Fail");
  }
}
