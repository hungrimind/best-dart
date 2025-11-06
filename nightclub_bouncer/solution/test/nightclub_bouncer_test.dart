import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Should welcome user when age is 18 or greater', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );

    // Send age input of 18 (minimum age)
    process.stdin.writeln('18');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('Welcome, you may enter.'),
      reason:
          'When age is 18 or greater, the program should print the welcome message. '
          'Check that your if condition uses >= (greater than or equal to) operator.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should welcome user when age is greater than 18', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );

    // Send age input above 18
    process.stdin.writeln('25');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('Welcome, you may enter.'),
      reason:
          'When age is greater than 18, the program should print the welcome message. '
          'Make sure your if condition correctly handles ages above the minimum.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should deny entry when age is less than 18', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );

    // Send age input below 18
    process.stdin.writeln('17');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('Sorry, you are not old enough to enter.'),
      reason:
          'When age is less than 18, the program should print the denial message. '
          'Make sure you have an else block that handles this case.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should deny entry when age is much less than 18', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );

    // Send age input well below 18
    process.stdin.writeln('10');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('Sorry, you are not old enough to enter.'),
      reason:
          'When age is less than 18, the else block should execute and print the denial message. '
          'Check that your else block is properly connected to the if statement.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should prompt user for age', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );

    process.stdin.writeln('20');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('How old are you?'),
      reason:
          'The program should prompt the user by printing a question asking for their age. '
          'Make sure you use print() to display the prompt before reading input.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should read and convert string input to integer', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );

    // Send age input as string (which stdin always provides)
    process.stdin.writeln('21');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(
      output,
      contains('Welcome, you may enter.'),
      reason:
          'The program should correctly read string input from stdin and convert it to an integer. '
          'Make sure you use int.parse() to convert the string input to a number for comparison.',
    );
    expect(
      exitCode,
      equals(0),
      reason: 'The program should exit successfully without errors.',
    );
  });

  test('Should use if-else statement structure', () async {
    final code = await File('bin/nightclub_bouncer.dart').readAsString();

    // Check that the code contains an if statement
    final hasIfStatement = RegExp(r'\bif\s*\(').hasMatch(code);
    expect(
      hasIfStatement,
      true,
      reason:
          'This exercise requires using an if statement. Make sure you have written: if (condition) { ... }',
    );

    // Check that the code contains an else statement
    final hasElseStatement = RegExp(r'\belse\s*\{').hasMatch(code);
    expect(
      hasElseStatement,
      true,
      reason:
          'This exercise requires using an else statement. Make sure you have written: else { ... } '
          'after your if block to handle the case when the condition is false.',
    );

    // Check that the condition uses >= operator
    final hasGreaterThanOrEqual = RegExp(r'age\s*>=\s*18').hasMatch(code);
    expect(
      hasGreaterThanOrEqual,
      true,
      reason:
          'The if statement should check if age is greater than or equal to 18 using the >= operator. '
          'Make sure your condition is: age >= 18',
    );
  });

  test('Should declare age variable as integer', () async {
    final code = await File('bin/nightclub_bouncer.dart').readAsString();

    // Check that age is declared as int
    final hasIntDeclaration = RegExp(r'\bint\s+age\s*=').hasMatch(code);
    expect(
      hasIntDeclaration,
      true,
      reason:
          'You need to declare a variable named "age" as an integer type. '
          'Use: int age = int.parse(input)',
    );
  });

  test('Should have mutually exclusive outcomes', () async {
    // Test that both paths work correctly and are mutually exclusive
    final processWelcome = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );
    processWelcome.stdin.writeln('18');
    await processWelcome.stdin.close();
    final outputWelcome =
        await processWelcome.stdout.transform(const SystemEncoding().decoder).join();

    final processDeny = await Process.start(
      'dart',
      ['run', 'bin/nightclub_bouncer.dart'],
    );
    processDeny.stdin.writeln('17');
    await processDeny.stdin.close();
    final outputDeny =
        await processDeny.stdout.transform(const SystemEncoding().decoder).join();

    expect(
      outputWelcome,
      contains('Welcome, you may enter.'),
      reason:
          'When age is 18 or greater, only the welcome message should be printed.',
    );
    expect(
      outputWelcome,
      isNot(contains('Sorry, you are not old enough to enter.')),
      reason:
          'When age is 18 or greater, the denial message should NOT be printed. '
          'The if-else structure ensures only one path executes.',
    );

    expect(
      outputDeny,
      contains('Sorry, you are not old enough to enter.'),
      reason:
          'When age is less than 18, only the denial message should be printed.',
    );
    expect(
      outputDeny,
      isNot(contains('Welcome, you may enter.')),
      reason:
          'When age is less than 18, the welcome message should NOT be printed. '
          'The else block should handle this case exclusively.',
    );
  });
}

