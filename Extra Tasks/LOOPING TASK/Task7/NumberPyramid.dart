import 'dart:io';

void main() {
  print("Enter the number of rows for the pyramid: ");
  int? n = int.parse(stdin.readLineSync()!);
  print("Pyramid pattern with $n rows:");
  for (int i = 1; i <= n; i++) {
    // for (int j = 1; j <= n - i; j++) {
    //   print(" ");
    // }
    var row = 0;
    for (int k = 1; k <= i; k++) {
      row = (row * 10) + k;
      // print("$k");
    }
    print("$row");
  }
}
