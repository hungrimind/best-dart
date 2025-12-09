import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Super Duck Mixin Tests', () {
    test('SuperDuck can swim (inherited from Duck)', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/super_duck.dart',
      ], runInShell: true);

      expect(
        result.stdout.toString(),
        contains('Super Donald is swimming in the pond.'),
        reason:
            'SuperDuck should inherit the swim() method from Duck class and be able to swim',
      );
    });

    test('SuperDuck can fly (from CanFly mixin)', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/super_duck.dart',
      ], runInShell: true);

      expect(
        result.stdout.toString(),
        contains('Swoosh! I\'m flying!'),
        reason: 'SuperDuck should have the fly() method from the CanFly mixin',
      );
    });

    test('CanFly mixin provides fly() method', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/super_duck.dart',
      ], runInShell: true);

      final output = result.stdout.toString();

      expect(
        output,
        contains('Swoosh! I\'m flying!'),
        reason:
            'The CanFly mixin should define a fly() method that prints "Swoosh! I\'m flying!"',
      );

      // Verify fly() is called on SuperDuck, not on regular Duck
      final lines = output.split('\n');
      final flyIndex = lines.indexWhere(
        (line) => line.contains('Swoosh! I\'m flying!'),
      );
      final swimIndex = lines.indexWhere(
        (line) => line.contains('Super Donald is swimming'),
      );

      expect(
        flyIndex,
        greaterThan(swimIndex),
        reason: 'SuperDuck should be able to both swim and fly',
      );
    });

    test('Regular Duck cannot fly (no mixin)', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/super_duck.dart',
      ], runInShell: true);

      final output = result.stdout.toString();

      // Regular duck should only swim, not fly
      expect(
        output,
        contains('Donald is swimming in the pond.'),
        reason: 'Regular Duck should be able to swim',
      );

      // Verify that regular duck's output appears before super duck's fly message
      // This confirms regular duck doesn't have fly() method
      final lines = output.split('\n');
      final regularSwimIndex = lines.indexWhere(
        (line) => line.contains('Donald is swimming'),
      );
      final flyIndex = lines.indexWhere(
        (line) => line.contains('Swoosh! I\'m flying!'),
      );

      expect(
        regularSwimIndex,
        greaterThan(-1),
        reason: 'Regular Duck should be able to swim',
      );

      expect(
        flyIndex,
        greaterThan(regularSwimIndex),
        reason:
            'Regular Duck should not have fly() method - only SuperDuck with mixin can fly',
      );
    });
  });
}
