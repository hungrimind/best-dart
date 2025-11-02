import 'dart:io';
import 'package:test/test.dart';

void main() {
  const expectedString = 'She said: "That\'s a backslash: \\"';

  test('Prints the correct escaped string', () async {
    final result =
        await Process.run('dart', ['run', 'bin/escape_characters.dart']);
    final output = result.stdout.toString().trim();

    expect(output, equals(expectedString),
        reason:
            "The printed string does not exactly match the required output. Check your quotes, backslashes, and spacing.");
  });

  test('Includes an escaped single quote in the output', () async {
    final result =
        await Process.run('dart', ['run', 'bin/escape_characters.dart']);
    final output = result.stdout.toString().trim();

    // We check for the presence of the apostrophe.
    expect(output.contains("That's"), isTrue,
        reason:
            "Your string seems to be missing the single quote (apostrophe) in the word \"That's\".");
  });

  test('Includes a double quote in the output', () async {
    final result =
        await Process.run('dart', ['run', 'bin/escape_characters.dart']);
    final output = result.stdout.toString().trim();

    // We check for the presence of the double quote character.
    expect(output.contains('"'), isTrue,
        reason:
            "Your string is missing the double quote character (\"). Remember to include it as part of the text.");
  });

  test('Includes a backslash in the output', () async {
    final result =
        await Process.run('dart', ['run', 'bin/escape_characters.dart']);
    final output = result.stdout.toString().trim();

    // We check for the presence of the backslash character.
    expect(output.contains('\\'), isTrue,
        reason:
            "Your string is missing the backslash character (\\). Remember, to include one backslash, you need to type two (`\\\\`).");
  });
}
