import 'dart:io';

void main() {
  print('Enter a number to see its multiplication table:');
  String? input = stdin.readLineSync();
  
  if (input == null) {
    return;
  }
  
  int number = int.parse(input);
  
  print('Multiplication table for $number:');
  
  for (int i = 1; i <= 10; i++) {
    int product = number * i;
    print('$number x $i = $product');
  }
}

