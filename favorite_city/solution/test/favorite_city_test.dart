import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('Uses stdin.readLineSync() to read user input from the console',
      () async {
    // Read the source file to verify it uses stdin.readLineSync()
    final sourceFile = File('bin/favorite_city.dart');
    final sourceCode = await sourceFile.readAsString();

    expect(sourceCode, contains('stdin.readLineSync()'),
        reason:
            'Your code should use stdin.readLineSync() to read user input from the console.');
  });
}
