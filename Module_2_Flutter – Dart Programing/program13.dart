import 'dart:io';

void main() {
  int n1, n2, n3;
  print("Enter First Number: ");
  n1 = int.parse(stdin.readLineSync()!);
  print("Enter First Number: ");
  n2 = int.parse(stdin.readLineSync()!);
  print("Enter First Number: ");
  n3 = int.parse(stdin.readLineSync()!);

  if (n1 > n2) {
    if (n1 > n3) {
      print("$n1 is Greatest Number.");
    } else {
      print("$n3 is Greatest Number.");
    }
  } else {
    if(n2>n3){
      print("$n2 is Greatest number.");
    }
    else{
      print("$n3 is Greatest Number.");
    }
    
  }
}
