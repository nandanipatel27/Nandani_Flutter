import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print('Select the shape to calculate area:');
    print('1. Triangle');
    print('2. Rectangle');
    print('3. Circle');
    print('4. Exit');
    
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      print('Enter the base of the triangle:');
      double base = double.parse(stdin.readLineSync()!);
      print('Enter the height of the triangle:');
      double height = double.parse(stdin.readLineSync()!);
      double area = 0.5 * base * height;
      print('The area of the triangle is $area');
    } else if (choice == 2) {
      print('Enter the length of the rectangle:');
      double length = double.parse(stdin.readLineSync()!);
      print('Enter the width of the rectangle:');
      double width = double.parse(stdin.readLineSync()!);
      double area = length * width;
      print('The area of the rectangle is $area');
    } else if (choice == 3) {
      print('Enter the radius of the circle:');
      double radius = double.parse(stdin.readLineSync()!);
      double area = pi * radius * radius;
      print('The area of the circle is $area');
    } else if (choice == 4) {
      print('Exiting the program.');
      break;
    } else {
      print('Invalid choice. Please select a valid option.');
    }
  }
}
