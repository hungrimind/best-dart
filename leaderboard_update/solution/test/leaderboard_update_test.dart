import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Should print the top score (first element)', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/leaderboard_update.dart'],
    );

    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('1200'),
      reason:
          'The program should print the top score (first element) which is 1200. '
          'Make sure you access the first element using index 0: scores[0]',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should update the lowest score to 915', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/leaderboard_update.dart'],
    );

    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('915'),
      reason:
          'The program should update the last element to 915 and print it in the final leaderboard. '
          'Use scores[scores.length - 1] = 915 to update the last element.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should print the complete updated leaderboard', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/leaderboard_update.dart'],
    );

    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('[1200, 1150, 1020, 950, 915]'),
      reason:
          'The program should print the entire updated leaderboard list. '
          'Make sure you print the scores list after updating the last element.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });
}

