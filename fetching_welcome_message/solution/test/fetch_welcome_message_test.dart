// test/main_test.dart

import 'package:test/test.dart';
import 'dart:io';

// Helper function to run the user's main() and capture the output.
Future<String> runMain() async {
  var result = await Process.run('dart', [
    'run',
    'bin/fetch_welcome_message.dart',
  ]);
  if (result.exitCode != 0) {
    return "Error: ${result.stderr}";
  }
  return result.stdout.toString().trim();
}

// Helper function to get the content of the user's code file.
Future<String> getUserCode() async {
  final file = File('bin/fetch_welcome_message.dart');
  return await file.readAsString();
}

void main() {
  test('Program should run and print the welcome message', () async {
    final output = await runMain();
    expect(
      output,
      endsWith("Welcome to our app!"),
      reason:
          'The program should print "Welcome to our app!" after fetching the message',
    );
  });

  test('The printWelcomeMessage function must be declared as async', () async {
    final code = await getUserCode();
    // Check for async function declaration
    final pattern = RegExp(
      r'Future<void>\s+printWelcomeMessage\s*\(\s*\)\s+async',
    );
    expect(
      code,
      matches(pattern),
      reason:
          'The printWelcomeMessage function must be declared as async (Future<void> printWelcomeMessage() async)',
    );
  });

  test(
    'The printWelcomeMessage function must use await to wait for fetchWelcomeMessage',
    () async {
      final code = await getUserCode();
      // Check that await is used before fetchWelcomeMessage
      final pattern = RegExp(r'await\s+fetchWelcomeMessage\s*\(\s*\)');
      expect(
        code,
        matches(pattern),
        reason:
            'The printWelcomeMessage function must use await when calling fetchWelcomeMessage()',
      );
    },
  );

  test(
    'The printWelcomeMessage function must call fetchWelcomeMessage',
    () async {
      final code = await getUserCode();
      // Check that fetchWelcomeMessage is called inside printWelcomeMessage
      expect(
        code,
        contains('fetchWelcomeMessage()'),
        reason:
            'The printWelcomeMessage function must call fetchWelcomeMessage()',
      );
    },
  );

  test('The printWelcomeMessage function must print the message', () async {
    final code = await getUserCode();
    // Check that print is called with the message variable
    final pattern = RegExp(r'print\s*\(\s*message\s*\)');
    expect(
      code,
      matches(pattern),
      reason:
          'The printWelcomeMessage function must print the message variable',
    );
  });
}
