import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Personal Greeting Tests', () {
    test('should run without errors and pass all tests', () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/personal_greeting.dart'],
        workingDirectory: Directory.current.path,
      );

      expect(result.exitCode, equals(0),
          reason: 'Program should exit with code 0');

      final output = result.stdout.toString();

      // Check that all tests passed
      expect(output, contains('✅ PASSED'),
          reason: 'Should contain passing tests');
      expect(output, isNot(contains('❌ FAILED')),
          reason: 'Should not contain any failing tests');

      // Verify all test cases ran
      expect(output,
          contains('should create the correct greeting for a new user'));
      expect(output,
          contains('should create the correct greeting for a returning user'));
      expect(output, contains('should include the correct prefix "Hello "'));
      expect(output, contains('should include the correct suffix "th visit!"'));
      expect(output,
          contains('should have correct spacing around the name and number'));
    });
  });
}
