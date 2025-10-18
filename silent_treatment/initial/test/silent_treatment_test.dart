import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('The first message should be printed', () async {
    final result = await Process.run(
      'dart',
      ['run', 'bin/silent_treatment.dart'],
    );

    final output = result.stdout.toString();

    expect(output, contains('Hello, Dart!'),
        reason:
            'The first print statement should remain active. It looks like it was commented out or removed.');
  });

  test('The last message should be printed', () async {
    final result = await Process.run(
      'dart',
      ['run', 'bin/silent_treatment.dart'],
    );

    final output = result.stdout.toString();

    expect(output, contains('Comments are cool!'),
        reason:
            'The last print statement should remain active. Don\'t forget to leave it in!');
  });

  test('The middle message should NOT be printed', () async {
    final result = await Process.run(
      'dart',
      ['run', 'bin/silent_treatment.dart'],
    );

    final output = result.stdout.toString();

    expect(output, isNot(contains('This line should not be printed.')),
        reason:
            'The line printing "This line should not be printed." is still being executed. Did you add `//` to the beginning of that line?');
  });
}
