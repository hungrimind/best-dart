import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('adds David to the roster', () async {
    final result = await Process.run('dart', ['bin/team_roster.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString().trim();

    // Verify David was added
    expect(
      output,
      contains('David'),
      reason: 'David should be added to the roster using .add() method.',
    );

    // Verify Alice and Charlie are still present
    expect(
      output,
      contains('Alice'),
      reason: 'Alice should still be in the roster.',
    );

    expect(
      output,
      contains('Charlie'),
      reason: 'Charlie should still be in the roster.',
    );
  });

  test('removes Bob from the roster', () async {
    final result = await Process.run('dart', ['bin/team_roster.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString().trim();

    // Verify Bob was removed
    expect(
      output,
      isNot(contains('Bob')),
      reason: 'Bob should be removed from the roster using .remove() method.',
    );

    // Verify Alice and Charlie are still present
    expect(
      output,
      contains('Alice'),
      reason: 'Alice should still be in the roster.',
    );

    expect(
      output,
      contains('Charlie'),
      reason: 'Charlie should still be in the roster.',
    );
  });
}
