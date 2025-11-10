import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('prints weekday message for Monday', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/day_of_week_switch.dart', 'Monday'],
    );

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), equals('It\'s a weekday.'));
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully for Monday');
  });

  test('prints weekend message for Saturday', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/day_of_week_switch.dart', 'Saturday'],
    );

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), equals('It\'s the weekend!'));
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully for Saturday');
  });

  test('prints invalid message for unknown day', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/day_of_week_switch.dart', 'InvalidDay'],
    );

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), equals('Invalid day.'));
    expect(exitCode, equals(0),
        reason: 'Program should exit successfully for invalid day');
  });

  test('uses switch statement instead of if-else', () async {
    final code = await File('bin/day_of_week_switch.dart').readAsString();

    // Check that the code contains a switch statement
    final hasSwitchStatement = RegExp(r'\bswitch\s*\(').hasMatch(code);
    expect(
      hasSwitchStatement,
      true,
      reason: 'This exercise requires using a switch statement. '
          'Make sure you have written: switch (dayOfWeek) { ... }',
    );

    // Check that the code does NOT use if-else chains for day checking
    final hasIfElseChain = RegExp(
            r'if\s*\([^)]*dayOfWeek[^)]*==.*\)\s*\{[^}]*print\s*\(')
        .hasMatch(code);
    expect(
      hasIfElseChain,
      false,
      reason: 'This exercise requires using a switch statement, not an if-else chain. '
          'Replace your if-else statements with a switch statement.',
    );
  });

  test('uses grouped cases for weekdays', () async {
    final code = await File('bin/day_of_week_switch.dart').readAsString();

    // Check that multiple weekday cases are grouped together
    final mondayPos = code.indexOf("case 'Monday':");
    final tuesdayPos = code.indexOf("case 'Tuesday':");
    final fridayPos = code.indexOf("case 'Friday':");

    expect(
      mondayPos != -1 && tuesdayPos != -1 && fridayPos != -1,
      true,
      reason: 'You need weekday cases (Monday, Tuesday, Wednesday, Thursday, Friday).',
    );

    // Check that weekdays are grouped (all appear before the first break or weekend case)
    final firstBreakAfterMonday = code.indexOf('break;', mondayPos);
    final saturdayPos = code.indexOf("case 'Saturday':");
    final firstWeekendOrBreak = firstBreakAfterMonday == -1
        ? saturdayPos
        : (saturdayPos == -1
            ? firstBreakAfterMonday
            : (firstBreakAfterMonday < saturdayPos
                ? firstBreakAfterMonday
                : saturdayPos));

    expect(
      fridayPos < firstWeekendOrBreak,
      true,
      reason: 'All weekday cases should be grouped together '
          'before the break statement. Use multiple case labels followed by a single break.',
    );
  });
}
