import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('returns A for score of 90', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('90');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Please enter the grade:'));
    expect(output.trim(), endsWith('A'));
    expect(exitCode, equals(0));
  });

  test('returns A for score of 95', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('95');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('A'));
    expect(exitCode, equals(0));
  });

  test('returns B for score of 85', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('85');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('B'));
    expect(exitCode, equals(0));
  });

  test('returns B for score of 80', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('80');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('B'));
    expect(exitCode, equals(0));
  });

  test('returns C for score of 75', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('75');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('C'));
    expect(exitCode, equals(0));
  });

  test('returns C for score of 70', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('70');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('C'));
    expect(exitCode, equals(0));
  });

  test('returns D for score of 65', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('65');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('D'));
    expect(exitCode, equals(0));
  });

  test('returns D for score of 60', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('60');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('D'));
    expect(exitCode, equals(0));
  });

  test('returns F for score of 59', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('59');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('F'));
    expect(exitCode, equals(0));
  });

  test('returns F for score of 0', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator_switch.dart'],
    );

    process.stdin.writeln('0');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('F'));
    expect(exitCode, equals(0));
  });

  test('uses switch statement instead of if-else', () async {
    final code = await File('bin/grade_calculator_switch.dart').readAsString();

    // Check that the code contains a switch statement
    final hasSwitchStatement = RegExp(r'\bswitch\s*\(').hasMatch(code);
    expect(
      hasSwitchStatement,
      true,
      reason: 'This exercise requires using a switch statement. '
          'Make sure you have written: switch (score) { ... }',
    );

    // Check that the code does NOT use if-else chains for grade assignment
    final hasIfElseChain =
        RegExp(r'if\s*\([^)]*score[^)]*>=.*\)\s*\{[^}]*grade\s*=')
            .hasMatch(code);
    expect(
      hasIfElseChain,
      false,
      reason:
          'This exercise requires using a switch statement, not an if-else chain. '
          'Replace your if-else statements with a switch statement using relational patterns.',
    );
  });

  test('uses relational patterns in switch cases', () async {
    final code = await File('bin/grade_calculator_switch.dart').readAsString();

    // Check that switch cases use relational patterns (>=)
    final hasRelationalPattern = RegExp(r'case\s*>=\s*\d+').hasMatch(code);
    expect(
      hasRelationalPattern,
      true,
      reason:
          'This exercise requires using relational patterns in switch cases. '
          'Use syntax like: case >= 90: instead of case 90:',
    );
  });

  test('has correct case order (highest to lowest)', () async {
    final code = await File('bin/grade_calculator_switch.dart').readAsString();

    // Find the position of each case pattern
    final case90Pos = code.indexOf('case >= 90');
    final case80Pos = code.indexOf('case >= 80');
    final case70Pos = code.indexOf('case >= 70');
    final case60Pos = code.indexOf('case >= 60');

    expect(
      case90Pos != -1 && case80Pos != -1 && case70Pos != -1 && case60Pos != -1,
      true,
      reason:
          'You need all four case statements: case >= 90, case >= 80, case >= 70, and case >= 60.',
    );

    // Check that cases are in descending order (important for switch fall-through)
    expect(
      case90Pos < case80Pos && case80Pos < case70Pos && case70Pos < case60Pos,
      true,
      reason:
          'The switch cases must be ordered from highest to lowest (90, 80, 70, 60). '
          'This order is crucial because switch statements execute the first matching case.',
    );
  });

  test('has default case for scores below 60', () async {
    final code = await File('bin/grade_calculator_switch.dart').readAsString();

    // Check that the code contains a default case
    final hasDefaultCase = RegExp(r'\bdefault\s*:').hasMatch(code);
    expect(
      hasDefaultCase,
      true,
      reason: 'You need a default case to handle scores below 60. '
          'Add: default: followed by grade = \'F\';',
    );
  });

  test('assigns correct grade variable in each case', () async {
    final code = await File('bin/grade_calculator_switch.dart').readAsString();

    // Check that each case assigns to grade variable
    final hasCase90 = RegExp(r'case\s*>=\s*90').hasMatch(code);
    final hasGradeA = RegExp(r"grade\s*=\s*[']A[']").hasMatch(code) ||
        RegExp(r'grade\s*=\s*["]A["]').hasMatch(code);

    final hasCase80 = RegExp(r'case\s*>=\s*80').hasMatch(code);
    final hasGradeB = RegExp(r"grade\s*=\s*[']B[']").hasMatch(code) ||
        RegExp(r'grade\s*=\s*["]B["]').hasMatch(code);

    final hasCase70 = RegExp(r'case\s*>=\s*70').hasMatch(code);
    final hasGradeC = RegExp(r"grade\s*=\s*[']C[']").hasMatch(code) ||
        RegExp(r'grade\s*=\s*["]C["]').hasMatch(code);

    final hasCase60 = RegExp(r'case\s*>=\s*60').hasMatch(code);
    final hasGradeD = RegExp(r"grade\s*=\s*[']D[']").hasMatch(code) ||
        RegExp(r'grade\s*=\s*["]D["]').hasMatch(code);

    final hasDefault = RegExp(r'\bdefault\s*:').hasMatch(code);
    final hasGradeF = RegExp(r"grade\s*=\s*[']F[']").hasMatch(code) ||
        RegExp(r'grade\s*=\s*["]F["]').hasMatch(code);

    expect(
      hasCase90 && hasGradeA,
      true,
      reason: 'The case >= 90 should assign grade = \'A\'.',
    );
    expect(
      hasCase80 && hasGradeB,
      true,
      reason: 'The case >= 80 should assign grade = \'B\'.',
    );
    expect(
      hasCase70 && hasGradeC,
      true,
      reason: 'The case >= 70 should assign grade = \'C\'.',
    );
    expect(
      hasCase60 && hasGradeD,
      true,
      reason: 'The case >= 60 should assign grade = \'D\'.',
    );
    expect(
      hasDefault && hasGradeF,
      true,
      reason: 'The default case should assign grade = \'F\'.',
    );
  });
}
