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

  test('Should not print message when temperature is exactly 25', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/weather_advisor.dart'],
    );

    // Send temperature input exactly 25
    process.stdin.writeln('25');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      isNot(contains("It's a hot day! Drink plenty of water.")),
      reason:
          'When temperature is exactly 25, the condition (temperature > 25) should be false. '
          'Make sure you are using the greater-than operator (>) and not greater-than-or-equal (>=).',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should not print message when temperature is less than 25', () async {
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

  test('Should read integer input correctly', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/weather_advisor.dart'],
    );

    // Send a high temperature value
    process.stdin.writeln('100');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains("It's a hot day! Drink plenty of water."),
      reason:
          'The program should correctly read and parse integer input from stdin. '
          'Make sure you are using int.parse() to convert the string input to an integer.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should use if statement with correct condition', () async {
    final code = await File('bin/weather_advisor.dart').readAsString();

    // Check that the code contains an if statement
    final hasIfStatement = RegExp(r'\bif\s*\(').hasMatch(code);
    expect(
      hasIfStatement,
      true,
      reason:
          'This exercise requires using an if statement. Make sure you have written: if (condition) { ... }',
    );

    // Check that the condition uses the greater-than operator
    final hasGreaterThan = RegExp(r'temperature\s*>\s*25').hasMatch(code);
    expect(
      hasGreaterThan,
      true,
      reason:
          'The if statement should check if temperature is greater than 25 using the > operator. '
          'Make sure your condition is: temperature > 25',
    );
  });

  test('Should declare temperature variable as integer', () async {
    final code = await File('bin/weather_advisor.dart').readAsString();

    // Check that temperature is declared as int
    final hasIntDeclaration =
        RegExp(r'\bint\s+temperature\s*=').hasMatch(code);
    expect(
      hasIntDeclaration,
      true,
      reason:
          'You need to declare a variable named "temperature" as an integer type. '
          'Use: int temperature = ...',
    );
  });
}

