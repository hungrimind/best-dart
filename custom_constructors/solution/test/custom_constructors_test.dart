import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('should create a Book object with custom constructor', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/custom_constructors.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason:
          'The program should run without errors. Make sure you have created a custom constructor for the Book class.',
    );
  });

  test('should initialize title property correctly', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/custom_constructors.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Title: The Dart Guide'),
      reason:
          'The title property should be initialized to "The Dart Guide" by the constructor. Make sure your constructor accepts a title parameter and assigns it to the title property.',
    );
  });

  test('should initialize author property correctly', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/custom_constructors.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Author: John Doe'),
      reason:
          'The author property should be initialized to "John Doe" by the constructor. Make sure your constructor accepts an author parameter and assigns it to the author property.',
    );
  });

  test('should initialize publicationYear property correctly', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/custom_constructors.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Publication Year: 2023'),
      reason:
          'The publicationYear property should be initialized to 2023 by the constructor. Make sure your constructor accepts a publicationYear parameter and assigns it to the publicationYear property.',
    );
  });

  test('should print all properties after object creation', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/custom_constructors.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Title: The Dart Guide'),
      reason: 'The program should print the title property.',
    );

    expect(
      output,
      contains('Author: John Doe'),
      reason: 'The program should print the author property.',
    );

    expect(
      output,
      contains('Publication Year: 2023'),
      reason: 'The program should print the publicationYear property.',
    );
  });
}
