import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Safe Data Parsing', () {
    test('should handle valid age strings without crashing', () {
      // Run the program multiple times to catch different scenarios
      // Since fetchUserData() returns random values, we need multiple runs
      for (int i = 0; i < 20; i++) {
        final result = Process.runSync(
          'dart',
          ['run', 'bin/safe_data_parsing.dart'],
          runInShell: true,
        );
        
        // Program should not crash (exit code 0)
        expect(
          result.exitCode,
          0,
          reason: 'Program crashed when parsing age. You need to add try-catch error handling.',
        );
        
        // Output should either be a valid age message or an error message
        final output = result.stdout.toString();
        final hasValidAge = output.contains('User age is:') && 
                           RegExp(r'User age is: \d+').hasMatch(output);
        final hasError = output.contains('Error: Could not parse age');
        
        expect(
          hasValidAge || hasError,
          true,
          reason: 'Program output should either show "User age is: [number]" or an error message.',
        );
      }
    }, timeout: Timeout(Duration(seconds: 30)));

    test('should print correct format for valid ages', () {
      bool foundValidAge = false;
      
      // Run multiple times to find a valid age case
      for (int i = 0; i < 30; i++) {
        final result = Process.runSync(
          'dart',
          ['run', 'bin/safe_data_parsing.dart'],
          runInShell: true,
        );
        
        final output = result.stdout.toString();
        if (RegExp(r'User age is: \d+').hasMatch(output)) {
          foundValidAge = true;
          expect(
            output,
            contains('User age is:'),
            reason: 'When age is valid, output should include "User age is: [age]"',
          );
          break;
        }
      }
      
      // At least one valid age should be found in 30 runs
      expect(
        foundValidAge,
        true,
        reason: 'Could not find a valid age case. This might indicate an issue with the implementation.',
      );
    }, timeout: Timeout(Duration(seconds: 30)));

    test('should handle invalid age strings with error message', () {
      bool foundError = false;
      
      // Run multiple times to find an invalid age case
      for (int i = 0; i < 30; i++) {
        final result = Process.runSync(
          'dart',
          ['run', 'bin/safe_data_parsing.dart'],
          runInShell: true,
        );
        
        final output = result.stdout.toString();
        if (output.contains('Error: Could not parse age')) {
          foundError = true;
          expect(
            output,
            contains('Error: Could not parse age. The value is not a valid number.'),
            reason: 'When age is invalid, output should include the error message about parsing failure.',
          );
          break;
        }
      }
      
      // At least one error case should be found in 30 runs
      expect(
        foundError,
        true,
        reason: 'Could not find an invalid age case. This might indicate an issue with the implementation.',
      );
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}

