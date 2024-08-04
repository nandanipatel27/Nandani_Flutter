import 'dart:io';

void main() {
  print('Enter the number of minutes you exercise per week:');
  int minutes = int.parse(stdin.readLineSync()!);

  String fitnessLevel;
  if (minutes >= 0 && minutes <= 59) {
    fitnessLevel = 'Sedentary';
  } else if (minutes >= 60 && minutes <= 149) {
    fitnessLevel = 'Moderately Active';
  } else if (minutes >= 150 && minutes <= 299) {
    fitnessLevel = 'Active';
  } else if (minutes >= 300) {
    fitnessLevel = 'Very Active';
  } else {
    print('Invalid input for minutes.');
    return;
  }

  print(
      'Based on your exercise routine, you are categorized as: $fitnessLevel');
}
