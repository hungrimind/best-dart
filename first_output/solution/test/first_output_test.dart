import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Debugging with Print Challenge', () {
    test('should print the correct result "The result is: 8"', () async {
      final result = await Process.run('dart', ['bin/first_output.dart']);
      final output = result.stdout.toString().trim();

      expect(output, isNotEmpty,
          reason:
              'Your program should print something to the console. Use print statements to debug!');

      // Check that the final output contains the correct result
      expect(output, contains('The result is: 8'),
          reason:
              'The output should include "The result is: 8". Use print statements to see what value the variable `three` actually has, then fix it.');
    });

    test('should demonstrate debugging with print statements', () async {
      final result = await Process.run('dart', ['bin/first_output.dart']);
      final output = result.stdout.toString().trim();
      final lines = output.split('\n');

      // We expect at least some print output showing the debugging process
      expect(lines.length, greaterThanOrEqualTo(1),
          reason:
              'Add print statements to see what values your variables have!');
    });
  });
}
