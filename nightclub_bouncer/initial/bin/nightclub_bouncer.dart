import 'dart:io';

void main() {
  print('How old are you?');
  String? input = stdin.readLineSync();
  int age = int.parse(input!);
  
  // TODO: Write an if-else statement that checks if age is 18 or greater
  // If true, print: "Welcome, you may enter."
  // Else, print: "Sorry, you are not old enough to enter."
  if (age >= 18) {
    print('Welcome, you may enter.');
  }
}

