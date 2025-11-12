import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('prints welcome message for each guest using for-in loop', () async {
    final result = await Process.run('dart', ['bin/greeting_party_guests.dart']);
    
    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );
    
    final output = result.stdout.toString();
    
    // Verify Alice receives a welcome message
    expect(
      output,
      contains('Welcome to the party, Alice!'),
      reason: 'The program should print a welcome message for Alice using a for-in loop.',
    );
    
    // Verify Bob receives a welcome message
    expect(
      output,
      contains('Welcome to the party, Bob!'),
      reason: 'The program should print a welcome message for Bob using a for-in loop.',
    );
    
    // Verify Charlie receives a welcome message
    expect(
      output,
      contains('Welcome to the party, Charlie!'),
      reason: 'The program should print a welcome message for Charlie using a for-in loop.',
    );
    
    // Verify all three messages are printed (exact count)
    final messageCount = 'Welcome to the party,'.allMatches(output).length;
    expect(
      messageCount,
      equals(3),
      reason: 'The program should print exactly 3 welcome messages, one for each guest in the list.',
    );
  });
}

