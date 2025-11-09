import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Guesses correctly on first try', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/guessing_game.dart'],
    );

    // Send correct guess
    process.stdin.writeln('7');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Guess the number:'),
        reason: 'Program should prompt user to guess the number');
    expect(output, contains('You got it!'),
        reason: 'Program should print "You got it!" when guess is correct');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after correct guess');
  });

  test('Handles too high guess then correct guess', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/guessing_game.dart'],
    );

    // Send too high guess, then correct guess
    process.stdin.writeln('10');
    process.stdin.writeln('7');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Too high!'),
        reason:
            'Program should print "Too high!" when guess is greater than secret number');
    expect(output, contains('You got it!'),
        reason: 'Program should print "You got it!" when guess is correct');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after correct guess');
  });

  test('Handles too low guess then correct guess', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/guessing_game.dart'],
    );

    // Send too low guess, then correct guess
    process.stdin.writeln('3');
    process.stdin.writeln('7');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Too low!'),
        reason:
            'Program should print "Too low!" when guess is less than secret number');
    expect(output, contains('You got it!'),
        reason: 'Program should print "You got it!" when guess is correct');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after correct guess');
  });

  test('Handles multiple incorrect guesses before correct guess', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/guessing_game.dart'],
    );

    // Send multiple incorrect guesses, then correct guess
    process.stdin.writeln('10');
    process.stdin.writeln('3');
    process.stdin.writeln('5');
    process.stdin.writeln('9');
    process.stdin.writeln('7');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Too high!'),
        reason:
            'Program should print "Too high!" for guesses greater than secret number');
    expect(output, contains('Too low!'),
        reason:
            'Program should print "Too low!" for guesses less than secret number');
    expect(output, contains('You got it!'),
        reason: 'Program should print "You got it!" when guess is correct');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after correct guess');
  });

  test('Continues looping until correct guess', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/guessing_game.dart'],
    );

    // Send multiple incorrect guesses
    process.stdin.writeln('1');
    process.stdin.writeln('2');
    process.stdin.writeln('3');
    process.stdin.writeln('4');
    process.stdin.writeln('5');
    process.stdin.writeln('6');
    process.stdin.writeln('7');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    // Count occurrences of "Guess the number:" - should appear multiple times
    final guessPromptCount = 'Guess the number:'.allMatches(output).length;
    expect(guessPromptCount, greaterThan(1),
        reason:
            'Program should repeatedly ask for guesses using a while loop until correct answer');
    expect(output, contains('You got it!'),
        reason:
            'Program should eventually print "You got it!" when correct guess is made');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after correct guess');
  });
}
