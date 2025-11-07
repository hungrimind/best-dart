import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('returns A for score of 90', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator.dart'],
    );

    process.stdin.writeln('90');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Please enter the student\'s score:'));
    expect(output.trim(), endsWith('A'));
    expect(exitCode, equals(0));
  });

  test('returns A for score of 95', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
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
      ['run', 'bin/grade_calculator.dart'],
    );

    process.stdin.writeln('0');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output.trim(), endsWith('F'));
    expect(exitCode, equals(0));
  });
}

