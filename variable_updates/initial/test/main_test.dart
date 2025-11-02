// test.dart
import 'dart:io';
import 'package:test/test.dart';

void main() {
  test(
    'Calculates the initial cost correctly',
    () async {
      // Run the program and capture its output
      final result = await Process.run('dart', ['bin/main.dart']);
      final output = result.stdout.toString().trim();
      final lines = output.split('\n');

      expect(
        lines,
        isNotEmpty,
        reason:
            'Your code did not print anything. Make sure you have the print statements from the starting code.',
      );
      expect(
        lines.first,
        'Initial cost: 15',
        reason:
            'The first print should show the cost for 3 potions at 5 gold each. Check your initial calculation for `totalCost`.',
      );
    },
  );

  test(
    'Program should run without errors',
    () async {
      final result = await Process.run('dart', ['bin/main.dart']);

      expect(
        result.exitCode,
        equals(0),
        reason: 'The program should run without errors. Check your syntax.',
      );
    },
  );
}
