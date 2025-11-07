import 'dart:io';

void main() {
  // Prompt the user to enter a numerical score
  print('Please enter the student\'s score:');
  
  // Read the input from the console
  String input = stdin.readLineSync()!;
  
  // Convert the input string to a number
  int score = int.parse(input);
  
  // Use an if/else if/else chain to determine the letter grade
  String grade;
  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }
  
  // Print the letter grade to the console
  print(grade);
}

