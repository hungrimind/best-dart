import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('formats address with positional street and named city and postalCode', () async {
    final result = await Process.run('dart', ['bin/format_address.dart']);
    
    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );
    
    final output = result.stdout.toString().trim();
    
    expect(
      output,
      equals('123 Main St, Anytown, 12345'),
      reason: 'The formatAddress function should combine street, city, and postalCode in the format "street, city, postalCode".',
    );
  });
  
  test('function accepts positional parameter before named parameters', () async {
    // This test verifies the function signature is correct
    // by checking that the program compiles and runs successfully
    final result = await Process.run('dart', ['analyze', 'bin/format_address.dart']);
    
    expect(
      result.exitCode,
      equals(0),
      reason: 'The function signature should have positional parameter before named parameters. Positional parameters must come first in the function declaration.',
    );
  });
}

