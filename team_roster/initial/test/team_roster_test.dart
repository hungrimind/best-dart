import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('adds David to the roster and removes Bob', () async {
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
    
    // Verify the final roster contains exactly 3 players
    final expectedOutput = '[Alice, Charlie, David]';
    expect(
      output,
      equals(expectedOutput),
      reason: 'The final roster should be [Alice, Charlie, David] after adding David and removing Bob.',
    );
  });
}

