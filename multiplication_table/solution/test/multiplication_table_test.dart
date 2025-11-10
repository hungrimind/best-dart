import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Generates complete multiplication table for number 7', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/multiplication_table.dart'],
    );

    // Send number 7
    process.stdin.writeln('7');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Enter a number to see its multiplication table:'),
        reason:
            'Program should prompt user to enter a number for the multiplication table');
    expect(output, contains('Multiplication table for 7:'),
        reason:
            'Program should display a header showing which number\'s table is being generated');
    expect(output, contains('7 x 1 = 7'),
        reason:
            'Program should print the first multiplication line using a for loop');
    expect(output, contains('7 x 10 = 70'),
        reason:
            'Program should print the last multiplication line (10th iteration) using a for loop');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after generating the table');
  });

  test('Uses for loop to iterate exactly 10 times', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/multiplication_table.dart'],
    );

    // Send number 3
    process.stdin.writeln('3');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    // Count how many multiplication lines are printed
    final linePattern = RegExp(r'3 x \d+ = \d+');
    final matches = linePattern.allMatches(output);
    expect(matches.length, equals(10),
        reason:
            'Program should use a for loop to iterate exactly 10 times, printing one multiplication line per iteration');

    // Verify the loop starts at 1 and ends at 10
    expect(output, contains('3 x 1 = 3'),
        reason:
            'For loop should start at 1 (first iteration of the loop counter)');
    expect(output, contains('3 x 10 = 30'),
        reason:
            'For loop should end at 10 (last iteration of the loop counter)');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after generating the table');
  });

  test('Calculates products correctly using loop variable', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/multiplication_table.dart'],
    );

    // Send number 12
    process.stdin.writeln('12');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    // Verify calculations are correct for various iterations
    expect(output, contains('12 x 1 = 12'),
        reason:
            'Program should calculate product correctly using the loop variable in the first iteration');
    expect(output, contains('12 x 5 = 60'),
        reason:
            'Program should calculate product correctly using the loop variable in the middle iteration');
    expect(output, contains('12 x 9 = 108'),
        reason:
            'Program should calculate product correctly using the loop variable near the end');
    expect(output, contains('12 x 10 = 120'),
        reason:
            'Program should calculate product correctly using the loop variable in the last iteration');
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully after generating the table');
  });
}
