import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('takeDamage method', () {
    test('should reduce health by the damage amount', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/take_damage.dart',
      ], runInShell: true);

      expect(
        result.exitCode,
        0,
        reason:
            'The program should run without errors. Make sure you have created the takeDamage method.',
      );

      final output = result.stdout.toString();

      expect(
        output,
        contains('Health after taking 25 damage: 75'),
        reason:
            'After taking 25 damage, health should be 75 (100 - 25). The takeDamage method should subtract damageAmount from health.',
      );
    });

    test('should handle multiple damage calls correctly', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/take_damage.dart',
      ], runInShell: true);

      expect(
        result.exitCode,
        0,
        reason: 'The program should run without errors.',
      );

      final output = result.stdout.toString();

      expect(
        output,
        contains('Health after taking 10 more damage: 65'),
        reason:
            'After taking 25 damage then 10 more damage, health should be 65 (100 - 25 - 10). The takeDamage method should continue to modify health correctly.',
      );
    });

    test('should have correct initial health', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/take_damage.dart',
      ], runInShell: true);

      expect(
        result.exitCode,
        0,
        reason: 'The program should run without errors.',
      );

      final output = result.stdout.toString();

      expect(
        output,
        contains('Initial health: 100'),
        reason: 'The player should start with 100 health.',
      );
    });
  });
}

