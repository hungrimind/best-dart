import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('User Input Challenge', () {
    test('Test 1: Reads and prints single word input', () async {
      final process = await Process.start(
        'dart',
        ['run', 'bin/favorite_city.dart'],
      );

      // Provide input to the program
      process.stdin.writeln('Paris');
      await process.stdin.close();

      // Capture output
      final output = await process.stdout.transform(utf8.decoder).join();
      final exitCode = await process.exitCode;

      expect(exitCode, 0, reason: 'Program should exit successfully');
      expect(output, contains('What is your favorite city?'),
          reason:
              'The program should first ask the user for their favorite city.');
      expect(output, contains('Wow, Paris sounds like a great place to visit!'),
          reason:
              "The program did not correctly print the user's input back to them. Expected 'Paris' to be included in the final message.");
    });

    test('Test 2: Handles input with spaces', () async {
      final process = await Process.start(
        'dart',
        ['run', 'bin/favorite_city.dart'],
      );

      process.stdin.writeln('New York');
      await process.stdin.close();

      final output = await process.stdout.transform(utf8.decoder).join();
      final exitCode = await process.exitCode;

      expect(exitCode, 0, reason: 'Program should exit successfully');
      expect(
          output, contains('Wow, New York sounds like a great place to visit!'),
          reason:
              'Ensure your code correctly handles input that contains spaces, like "New York".');
    });

    test('Test 3: Handles empty input', () async {
      final process = await Process.start(
        'dart',
        ['run', 'bin/favorite_city.dart'],
      );

      // User just presses Enter
      process.stdin.writeln('');
      await process.stdin.close();

      final output = await process.stdout.transform(utf8.decoder).join();
      final exitCode = await process.exitCode;

      expect(exitCode, 0, reason: 'Program should exit successfully');
      expect(output, contains('Wow,  sounds like a great place to visit!'),
          reason:
              'The program should still work correctly if the user provides no input and just presses Enter.');
    });

    test('Test 4: Uses stdin.readLineSync() to read input', () async {
      // Read the source file to verify it uses stdin.readLineSync()
      final sourceFile = File('bin/favorite_city.dart');
      final sourceCode = await sourceFile.readAsString();

      expect(sourceCode, contains('stdin.readLineSync()'),
          reason:
              'Your code should use stdin.readLineSync() to read user input from the console.');
    });
  });
}
