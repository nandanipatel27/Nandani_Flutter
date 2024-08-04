import 'dart:io';

void main() {
  print("Enter the number of terms for the Fibonacci sequence: ");
  int? n = int.parse(stdin.readLineSync()!); 

  int a = 0, b = 1;

  print("Fibonacci sequence up to $n terms:");

  for (int i = 0; i < n; i++) {
    print("$a "); 
    int next = a + b;  
    a = b;  
    b = next;  
  }
}
