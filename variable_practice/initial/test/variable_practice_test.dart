import 'dart:io';
import 'package:test/test.dart';

void main() {
  test(
    'Program should compile and run without errors',
    () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/variable_practice.dart'],
      );

      expect(
        result.exitCode,
        equals(0),
        reason:
            'Your code has compilation errors. Check for syntax errors and make sure your code compiles.',
      );
    },
  );

  test(
    'Should print the initial status "Current status: Feeling Great"',
    () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/variable_practice.dart'],
      );
      final output = result.stdout.toString();

      expect(
        output,
        contains('Current status: Feeling Great'),
        reason:
            'The output should include "Current status: Feeling Great". Make sure you declare the variable with `var currentStatus = "Feeling Great";` and print it.',
      );
    },
  );

  test(
    'Should print the updated status "Current status: Ready to Code"',
    () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/variable_practice.dart'],
      );
      final output = result.stdout.toString();

      expect(
        output,
        contains('Current status: Ready to Code'),
        reason:
            'The output should include "Current status: Ready to Code". Make sure you update the variable with `currentStatus = "Ready to Code";` and print it.',
      );
    },
  );
}
