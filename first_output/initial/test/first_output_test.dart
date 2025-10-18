import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Print Function Challenge', () {
    test('should print the exact string "Learning Dart is fun!"', () async {
      final result = await Process.run('dart', ['bin/first_output.dart']);
      final output = result.stdout.toString().trim();

      expect(output, isNotEmpty,
          reason:
              'You should print something to the console. The output is currently empty.');
      expect(output, equals('Learning Dart is fun!'),
          reason:
              'The output did not match the required string. Check for typos and proper casing.');
    });

    test('should not print any extra lines', () async {
      final result = await Process.run('dart', ['bin/first_output.dart']);
      final output = result.stdout.toString().trim();
      final lines = output.split('\n');

      expect(lines.length, equals(1),
          reason: 'You should only print one line of text.');
    });

    test('should have correct casing', () async {
      final result = await Process.run('dart', ['bin/first_output.dart']);
      final output = result.stdout.toString().trim();

      expect(output, equals('Learning Dart is fun!'),
          reason:
              'The string must have the exact casing as specified: "Learning Dart is fun!"');
      expect(output, isNot(equals('learning dart is fun!')),
          reason:
              'Incorrect casing detected. Remember Dart is case-sensitive!');
    });
  });
}
