import 'dart:io';

void main() {
  print('Enter a number to see its multiplication table:');
  String? input = stdin.readLineSync();
  
  if (input == null) {
    return;
  }
  
  int number = int.parse(input);
  
  print('Multiplication table for $number:');
  
  // TODO: Use a for loop to iterate from 1 to 10
  // Inside the loop, calculate the product of number and the loop variable
  // Print each line in the format: "number x loopVariable = product"
}

