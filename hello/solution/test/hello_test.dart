import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('Hello Challenge', () {
    test('Read name and prints greeting with single word', () async {
      final process = await Process.start(
        'dart',
        ['run', 'bin/hello.dart'],
      );

      // Provide input to the program
      process.stdin.writeln('Alice');
      await process.stdin.close();

      // Capture output
      final output = await process.stdout.transform(utf8.decoder).join();
      final exitCode = await process.exitCode;

      expect(exitCode, 0, reason: 'Program should exit successfully');
      expect(output, contains('What is your name?'),
          reason: 'The program should ask the user for their name.');
      expect(output, contains('Hello, Alice'),
          reason:
              "The program should print 'Hello,' followed by the name when a name is entered.");
    });
  });
}
