import 'dart:io';
import 'package:test/test.dart';

void main() {
  test(
    'defines Player class with correct properties and default values',
    () async {
      final result = await Process.run('dart', ['bin/player_profile.dart']);

      expect(
        result.exitCode,
        equals(0),
        reason: 'The program should run without errors.',
      );

      final output = result.stdout.toString();

      // Verify player1 has modified values
      expect(
        output,
        contains('Player 1:'),
        reason: 'The program should print Player 1 information.',
      );

      expect(
        output,
        contains('Username: Alex'),
        reason: 'Player1 username should be changed to "Alex".',
      );

      expect(
        output,
        contains('Health: 85'),
        reason: 'Player1 health should be changed to 85.',
      );

      expect(
        output,
        contains('Score: 1500.5'),
        reason: 'Player1 score should be changed to 1500.5.',
      );
    },
  );

  test('player2 retains default values independently', () async {
    final result = await Process.run('dart', ['bin/player_profile.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    // Verify player2 has default values
    expect(
      output,
      contains('Player 2:'),
      reason: 'The program should print Player 2 information.',
    );

    expect(
      output,
      contains('Username: Guest'),
      reason:
          'Player2 username should remain "Guest" (default value), showing that objects are independent.',
    );

    expect(
      output,
      contains('Health: 100'),
      reason:
          'Player2 health should remain 100 (default value), showing that objects are independent.',
    );

    expect(
      output,
      contains('Score: 0.0'),
      reason:
          'Player2 score should remain 0.0 (default value), showing that objects are independent.',
    );
  });

  test('both players are printed showing independence', () async {
    final result = await Process.run('dart', ['bin/player_profile.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    // Verify both players are printed
    expect(
      output,
      contains('Player 1:'),
      reason: 'Player 1 information should be printed.',
    );

    expect(
      output,
      contains('Player 2:'),
      reason: 'Player 2 information should be printed.',
    );

    // Verify the output shows different values for each player
    final player1Index = output.indexOf('Player 1:');
    final player2Index = output.indexOf('Player 2:');

    expect(
      player1Index,
      lessThan(player2Index),
      reason: 'Player 1 should be printed before Player 2.',
    );
  });
}

