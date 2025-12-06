import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('should set width and height with valid values', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/smart_rectangle.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason:
          'The program should run without errors. Make sure you have created the width and height setters.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Width: 5'),
      reason:
          'After setting width to 5, the width getter should return 5. Make sure you have created a width getter.',
    );

    expect(
      output,
      contains('Height: 10'),
      reason:
          'After setting height to 10, the height getter should return 10. Make sure you have created a height getter.',
    );
  });

  test('should calculate area correctly', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/smart_rectangle.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Area: 50'),
      reason:
          'The area should be 50 (5 * 10). Make sure you have created an area getter that calculates width * height.',
    );
  });

  test('should reject invalid width values', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/smart_rectangle.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('After trying to set invalid values:'),
      reason: 'The program should test invalid values.',
    );

    expect(
      output,
      contains('Width: 5'),
      reason:
          'After trying to set width to -5, it should remain 5. The width setter should only update _width if the value is greater than 0.',
    );
  });

  test('should reject invalid height values', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/smart_rectangle.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Height: 10'),
      reason:
          'After trying to set height to 0, it should remain 10. The height setter should only update _height if the value is greater than 0.',
    );
  });

  test('should update area when dimensions change', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/smart_rectangle.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Area: 50'),
      reason:
          'The area getter should calculate the current area based on width and height. After setting width to 5 and height to 10, area should be 50.',
    );
  });
}

