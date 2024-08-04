import 'dart:io';

void main() {
  stdout.write("Enter the number of terms for the Fibonacci sequence: ");
  int? n = int.parse(stdin.readLineSync()!);

  int a = 0, b = 1;
  int i = 0;

  print("Fibonacci sequence up to $n terms:");

  while (i < n) {
    print("$a "); 
    int next = a + b;  
    a = b; 
    b = next;  
    i++; 
  }
}
