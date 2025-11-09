import 'dart:io';

void main() {
  // Secret number - you can change this to any integer you like
  int secretNumber = 7;

  // Keep asking until the user guesses correctly
  while (true) {
    print('Guess the number:');
    String? input = stdin.readLineSync();
    
    if (input == null) {
      continue; // Skip if no input
    }
    
    int guess = int.parse(input);
    
    if (guess > secretNumber) {
      print('Too high!');
    } else if (guess < secretNumber) {
      print('Too low!');
    } else {
      print('You got it!');
      break; // Exit the loop when correct
    }
  }
}

