import 'package:test/test.dart';
import 'dart:io';

void main() {
  late String userOutput;

  // Pre-test setup: Run the user's code and capture output
  setUpAll(() async {
    final result = await Process.run(
      'dart',
      ['run', 'bin/hello_dart.dart'],
    );
    userOutput = result.stdout.toString().trim();
  });

  // Test cases
  test('Test 1: Program must print to the console', () {
    expect(userOutput, isNotEmpty,
        reason:
            "Your program didn't print anything. Make sure you're using the print() function.");
  });

  test('Test 2: Output must be exactly "Hello, Dart!"', () {
    expect(userOutput, equals('Hello, Dart!'),
        reason:
            "The output was not an exact match. Check for typos, extra spaces, or incorrect capitalization.");
  });

  test('Test 3: Output should not contain extra lines or text', () {
    final lines = userOutput.split('\n');
    expect(lines.length, 1,
        reason: "Your program should only print a single line of text.");
    expect(lines.first, 'Hello, Dart!',
        reason: "The single line of output must be 'Hello, Dart!'");
  });

  test('Test 4: Entry point function `main` must be defined', () {
    // This test passes if the program runs at all
    bool programRan = userOutput.isNotEmpty;
    expect(programRan, isTrue,
        reason:
            "The program failed to run. Did you include the `void main() { ... }` function?");
  });
}
