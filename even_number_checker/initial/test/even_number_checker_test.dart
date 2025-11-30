import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('isEven returns true for even numbers', () async {
    final result = await Process.run('dart', ['bin/even_number_checker.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString().trim();
    final lines = output.split('\n');

    expect(
      lines[0],
      equals('true'),
      reason: 'isEven(4) should return true because 4 is an even number.',
    );

    expect(
      lines[2],
      equals('true'),
      reason: 'isEven(0) should return true because 0 is an even number.',
    );

    expect(
      lines[3],
      equals('true'),
      reason: 'isEven(-2) should return true because -2 is an even number.',
    );
  });

  test('isEven returns false for odd numbers', () async {
    final result = await Process.run('dart', ['bin/even_number_checker.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString().trim();
    final lines = output.split('\n');

    expect(
      lines[1],
      equals('false'),
      reason: 'isEven(7) should return false because 7 is an odd number.',
    );
  });

  test('isEven function has correct return type', () async {
    final result = await Process.run('dart', [
      'analyze',
      'bin/even_number_checker.dart',
    ]);

    expect(
      result.exitCode,
      equals(0),
      reason:
          'The isEven function must have a return type of bool. Make sure you specify "bool" before the function name.',
    );
  });
}

