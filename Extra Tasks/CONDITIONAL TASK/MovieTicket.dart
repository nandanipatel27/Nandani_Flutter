import 'dart:io';

void main() {
  print('Enter your age:');
  int age = int.parse(stdin.readLineSync()!);

  print('Enter the day of the week:');
  String day = stdin.readLineSync()!.trim().toLowerCase();

  double basePrice;
  if (age >= 0 && age <= 12) {
    basePrice = 5.0;
  } else if (age >= 13 && age <= 17) {
    basePrice = 8.0;
  } else if (age >= 18 && age <= 64) {
    basePrice = 12.0;
  } else if (age >= 65) {
    basePrice = 7.0;
  } else {
    print('Invalid age entered.');
    return;
  }

  double discount = 0.0;
  if (day == 'saturday' || day == 'sunday') {
    discount = 0.10; // 10% discount on weekends
  }

  double discountAmount = basePrice * discount;
  double finalPrice = basePrice - discountAmount;

  print('Base Price: \$${basePrice.toStringAsFixed(2)}');
  print('Discount: ${discount * 100}%');
  print('Final Price: \$${finalPrice.toStringAsFixed(2)}');
}
