import 'dart:io';

void main() {
  // Prompt the user to enter a numerical score
  print('Please enter the grade:');

  // Read the input from the console
  String input = stdin.readLineSync()!;

  // Convert the input string to a number
  int score = int.parse(input);

  // Use a switch statement with relational patterns to determine the letter grade
  // This is a powerful feature of modern Dart. The first case that
  // evaluates to true is executed.
  String grade;
  switch (score) {
    case >= 90:
      grade = 'A';
    case >= 80:
      grade = 'B';
    case >= 70:
      grade = 'C';
    case >= 60:
      grade = 'D';
    default: // Catches any score below 60
      grade = 'F';
  }

  // Print the letter grade to the console
  print(grade);
}
