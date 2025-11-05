import 'dart:io';

void main() {
  int temperature = int.parse(stdin.readLineSync()!);
  
  if (temperature > 25) {
    print("It's a hot day! Drink plenty of water.");
  }
}

