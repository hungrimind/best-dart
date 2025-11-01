import 'package:test/test.dart';
import 'dart:io';

void main() {
  late String userOutput;

  // Test cases
  test('Program must print to the console', () async {
    final result = await Process.run(
      'dart',
      ['run', 'bin/hello_dart.dart'],
    );
    userOutput = result.stdout.toString().trim();
    expect(userOutput, isNotEmpty,
        reason:
            "Your program didn't print anything. Make sure you're using the print() function.");
  });

  test('Output must be exactly "Hello, Dart!"', () async {
    final result = await Process.run(
      'dart',
      ['run', 'bin/hello_dart.dart'],
    );
    userOutput = result.stdout.toString().trim();
    expect(userOutput, equals('Hello, Dart!'),
        reason:
            "The output was not an exact match. Check for typos, extra spaces, or incorrect capitalization.");
  });
}
