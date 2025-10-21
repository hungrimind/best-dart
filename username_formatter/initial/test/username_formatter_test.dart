import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('username_formatter', () {
    test('Prints correct formatted username', () async {
      final result =
          await Process.run('dart', ['run', 'bin/username_formatter.dart']);
      final output = result.stdout.toString().trim();

      expect(output, equals('ADA'),
          reason:
              "Failed with the input 'ada-lovelace'. Expected 'ADA', but got '$output'. Make sure you are splitting the string correctly and converting the first part to uppercase.");
    });

    test('Output is not empty', () async {
      final result =
          await Process.run('dart', ['run', 'bin/username_formatter.dart']);
      final output = result.stdout.toString().trim();

      expect(output.isNotEmpty, isTrue,
          reason:
              "The program printed an empty string. You need to process the name and print the result.");
    });

    test('Output is uppercase', () async {
      final result =
          await Process.run('dart', ['run', 'bin/username_formatter.dart']);
      final output = result.stdout.toString().trim();

      expect(output, equals(output.toUpperCase()),
          reason:
              "The output should be in uppercase. Make sure you're using the toUpperCase() method.");
    });

    test('Output is the first part of the name', () async {
      final result =
          await Process.run('dart', ['run', 'bin/username_formatter.dart']);
      final output = result.stdout.toString().trim();

      expect(output.length, equals(3),
          reason:
              "The output should be 'ADA' (3 characters). Make sure you're splitting by hyphen and taking the first part.");
    });
  });
}
