import 'dart:io';

void main() {
  print('How old are you?');
  String? input = stdin.readLineSync();
  int age = int.parse(input!);
  
  if (age >= 18) {
    print('Welcome, you may enter.');
  } else {
    print('Sorry, you are not old enough to enter.');
  }
}

