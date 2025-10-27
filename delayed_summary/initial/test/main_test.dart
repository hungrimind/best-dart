// test/main_test.dart

import 'package:test/test.dart';
import 'dart:io';

// Helper function to run the user's main() and capture the output.
Future<String> runMain() async {
  var result = await Process.run('dart', ['run', 'bin/main.dart']);
  if (result.exitCode != 0) {
    return "Error: ${result.stderr}";
  }
  return result.stdout.toString().trim();
}

// Helper function to get the content of the user's code file.
Future<String> getUserCode() async {
  final file = File('bin/main.dart');
  return await file.readAsString();
}

void main() {
  test('Program should run and print the correct summary', () async {
    final output = await runMain();
    expect(output, equals("Tadas is 28 years old."));
  });

  test('The "summary" variable must be declared using the "late" keyword',
      () async {
    final code = await getUserCode();
    // This regular expression looks for 'late', followed by whitespace,
    // followed by 'String', followed by 'summary'.
    final pattern = RegExp(r'late\s+String\s+summary');
    expect(code, matches(pattern));
  });

  test('The "summary" variable should not be nullable', () async {
    final code = await getUserCode();
    // This test ensures the user didn't use `String?` as a workaround.
    final nullablePattern = RegExp(r'String\?\s+summary');
    expect(code, isNot(matches(nullablePattern)));
  });
}
