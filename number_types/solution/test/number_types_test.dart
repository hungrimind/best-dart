import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Number Types Tests', () {
    test('should run without errors and pass all tests', () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/number_types.dart'],
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
      expect(output, contains('Variable \'userAge\' should be an integer'));
      expect(output, contains('Variable \'userAge\' should have the value 25'));
      expect(output, contains('Variable \'productPrice\' should be a double'));
      expect(output,
          contains('Variable \'productPrice\' should have the value 19.95'));
    });
  });
}
