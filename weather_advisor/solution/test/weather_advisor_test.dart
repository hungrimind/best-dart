import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Should print hot day message when temperature is greater than 25',
      () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/weather_advisor.dart'],
    );

    // Send temperature input above 25
    process.stdin.writeln('30');
    await process.stdin.close();

    // Capture output
    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains("It's a hot day! Drink plenty of water."),
      reason:
          'When temperature is greater than 25, the program should print the hot day message. '
          'Check that your if statement condition uses the greater-than operator (>).',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should not print message when temperature is 25 or less', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/weather_advisor.dart'],
    );

    // Send temperature input below 25
    process.stdin.writeln('20');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      isNot(contains("It's a hot day! Drink plenty of water.")),
      reason:
          'When temperature is less than 25, the if condition should be false and the message should not be printed.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });
}
