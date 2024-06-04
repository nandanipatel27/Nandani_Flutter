import 'dart:io';

void main() {
  print("Enter your name: ");
  var name = stdin.readLineSync()!;

  print("Enter your gender: ");
  var gen = stdin.readLineSync()!;

  print("Enter your Age: ");
  var age = int.parse(stdin.readLineSync()!);

  print("Enter your product name: ");
  var product = stdin.readLineSync()!;

  print("Enter product weight in gram : ");
  var gram = int.parse(stdin.readLineSync()!);

  int gold_price = 5752;
  int making_charges = 845;

  int total_goldrate = gram * gold_price;
  int total_making_charges = gram * making_charges;
  int total_amount = total_goldrate + total_making_charges;
  double discount = 0;
  //double discountPercentage = 0;

  if (gen == "Male" || gen == "M") {
    if (age > 65) {
      if (total_amount <= 300000 && total_amount >= 200000) {
        discount = 0.20;
      } else if (total_amount <= 500000 && total_amount >= 300000) {
        discount = 0.30;
      } else if (total_amount > 500000) {
        discount = 0.35;
      }
    } else {
      if (total_amount <= 300000 && total_amount >= 200000) {
        discount = 0.10;
      } else if (total_amount <= 500000 && total_amount >= 300000) {
        discount = 0.20;
      } else if (total_amount > 500000) {
        discount =0.25;
      }
    }
  } else {
    if (age > 65) {
      if (total_amount <= 300000 && total_amount >= 200000) {
        discount = 0.25;
      } else if (total_amount <= 500000 && total_amount >= 300000) {
        discount = 0.35;
      } else if (total_amount > 500000) {
        discount = 0.40;
      }
    } else {
      if (total_amount <= 300000 && total_amount >= 200000) {
        discount = 0.15;
      } else if (total_amount <= 500000 && total_amount >= 300000) {
        discount = 0.25;
      } else if (total_amount > 500000) {
        discount = 0.30;
      }
    }
  }
  double discount_amount = total_goldrate * discount;
  double total_net_amount = total_amount - discount_amount;
  print("--------------------------------------------------------");
  print("NAME: $name");
  print("GENDER: $gen");
  print("AGE: $age");
  print("--------------------------------------------------------");
  print("PRODUCT: $product");
  print("PRODUCT GRAM: $gram gm");
  print("CURRENT GOLD RATE: $gold_price");
  print("____________________________________________");
  print("TOTAL GOLD RATE: $total_goldrate");
  print("____________________________________________");
  print("MAKING CHARGES PER GRAM: $making_charges");
  print("TOTAL MAKING CHARGES: $total_making_charges");
  print("____________________________________________");
  print("TOTAL AMOUNT: $total_amount");
  print("DISCOUNT PERCENTAGE:${discount * 100}%");
  print("DISCOUNTED_AMOUNT: $discount_amount[excluding making charges]");
  print("____________________________________________");
  print("TOTAL NET AMOUNT: $total_net_amount");
}



