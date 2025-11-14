import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('adds cookies to inventory', () async {
    final result = await Process.run('dart', ['bin/bakery_inventory.dart']);
    expect(
      result.stdout.toString(),
      contains('cookie'),
      reason: 'The inventory should include cookies after adding them.',
    );
    expect(
      result.stdout.toString(),
      contains('30'),
      reason: 'The inventory should show 30 cookies after the delivery.',
    );
  });

  test('updates croissant stock after sale', () async {
    final result = await Process.run('dart', ['bin/bakery_inventory.dart']);
    expect(
      result.stdout.toString(),
      contains('croissant'),
      reason: 'The inventory should still include croissants.',
    );
    expect(
      result.stdout.toString(),
      contains('7'),
      reason: 'The croissant count should be 7 after selling 5 (12 - 5 = 7).',
    );
  });

  test('removes baguette from inventory', () async {
    final result = await Process.run('dart', ['bin/bakery_inventory.dart']);
    expect(
      result.stdout.toString(),
      isNot(contains('baguette')),
      reason: 'The inventory should not include baguette after removing it.',
    );
  });

  test('prints final inventory map', () async {
    final result = await Process.run('dart', ['bin/bakery_inventory.dart']);
    expect(
      result.stdout.toString().trim(),
      isNotEmpty,
      reason: 'The program should print the final inventory map.',
    );
    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run successfully without errors.',
    );
  });
}

