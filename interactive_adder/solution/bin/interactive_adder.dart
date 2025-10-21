import 'dart:io'; // Loads the Input/Output library

void main() {
  // --- This part of the code gets input from the user ---
  print('Enter the first number:');
  String input1 = stdin.readLineSync()!; // Reads the user's first input

  print('Enter the second number:');
  String input2 = stdin.readLineSync()!; // Reads the user's second input

  // --- YOUR CODE GOES BELOW ---

  // 1. Use int.parse() to convert the `input1` string into an integer.
  int num1 = int.parse(input1);

  // 2. Use int.parse() to convert the `input2` string into an integer.
  int num2 = int.parse(input2);

  // 3. Add the two new integer values together.
  int sum = num1 + num2;

  // 4. Print the final sum to the console.
  print('The sum is: $sum');
}
