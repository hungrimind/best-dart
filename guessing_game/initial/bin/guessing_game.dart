import 'dart:io';

void main() {
  // Secret number - you can change this to any integer you like
  int secretNumber = 7;

  print('Guess the number:');
  String? input = stdin.readLineSync();
  
  int guess = int.parse(input!);
  
  if (guess > secretNumber) {
    print('Too high!');
  } else if (guess < secretNumber) {
    print('Too low!');
  } else {
    print('You got it!');
  }
}

