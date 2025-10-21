import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('adds two positive numbers correctly', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/interactive_adder.dart'],
    );

    // Send input to the process
    process.stdin.writeln('50');
    process.stdin.writeln('25');
    await process.stdin.close();

    // Capture output
    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('Enter the first number:'));
    expect(output, contains('Enter the second number:'));
    expect(output, contains('The sum is: 75'));
    expect(exitCode, equals(0));
  });

  test('adds two numbers with zero', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/interactive_adder.dart'],
    );

    process.stdin.writeln('100');
    process.stdin.writeln('0');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('The sum is: 100'));
    expect(exitCode, equals(0));
  });

  test('adds negative and positive numbers', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/interactive_adder.dart'],
    );

    process.stdin.writeln('-15');
    process.stdin.writeln('30');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('The sum is: 15'));
    expect(exitCode, equals(0));
  });

  test('adds two negative numbers', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/interactive_adder.dart'],
    );

    process.stdin.writeln('-10');
    process.stdin.writeln('-5');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('The sum is: -15'));
    expect(exitCode, equals(0));
  });

  test('adds large numbers correctly', () async {
    final process = await Process.start(
      'dart',
      ['run', 'bin/interactive_adder.dart'],
    );

    process.stdin.writeln('999');
    process.stdin.writeln('1');
    await process.stdin.close();

    final output =
        await process.stdout.transform(const SystemEncoding().decoder).join();
    final exitCode = await process.exitCode;

    expect(output, contains('The sum is: 1000'));
    expect(exitCode, equals(0));
  });
}
