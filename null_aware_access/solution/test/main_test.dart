import 'dart:io';
import 'package:test/test.dart';

Future<ProcessResult> runMain() async {
  // Runs the user's program and captures stdout/stderr/exitCode
  return await Process.run('dart', ['bin/main.dart']);
}

void main() {
  test('Program should not crash when accessing property on null using ?.',
      () async {
    final result = await runMain();
    expect(
      result.exitCode,
      0,
      reason:
          'Using the dot operator (.) on a null value throws a runtime error. '
          'Use ?. so that accessing a property on null returns null and does not crash.',
    );
  });

  test('First line should be "null" when the value is null', () async {
    final result = await runMain();
    final stdoutStr = result.stdout.toString();
    final lines =
        stdoutStr.split(RegExp(r'\r?\n')).where((l) => l.isNotEmpty).toList();

    expect(
      lines.isNotEmpty,
      true,
      reason:
          'The program should print something. Expected at least one line of output.',
    );

    expect(
      lines[0].trim(),
      'null',
      reason:
          'When the receiver is null, ?. returns null, and printing it should output "null".',
    );
  });

  test('Source should actually use the null-aware access operator (?.)',
      () async {
    final code = await File('bin/main.dart').readAsString();
    final usesNullAware =
        RegExp(r'\?\.\s*isNegative').allMatches(code).length >= 1;

    expect(
      usesNullAware,
      true,
      reason:
          'This exercise is about using the null-aware access operator (?.). '
          'Ensure you are using ?. when accessing isNegative on possibly-null values.',
    );
  });
}
