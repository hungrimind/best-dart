// test/main_test.dart

import 'package:test/test.dart';
import 'dart:io';

// Helper function to run the user's main() and capture the output.
Future<String> runMain() async {
  var result = await Process.run('dart', ['run', 'bin/main.dart']);
  if (result.exitCode != 0) {
    return "Error: ${result.stderr}";
  }
  return result.stdout.toString().trim();
}

// Helper function to get the content of the user's code file.
Future<String> getUserCode() async {
  final file = File('bin/main.dart');
  return await file.readAsString();
}

void main() {
  test('Program should handle data events and print "Data received: [value]"',
      () async {
    final output = await runMain();
    expect(output, contains('Data received: 42'),
        reason: 'Expected output to contain "Data received: 42" when stream emits data');
    expect(output, contains('Data received: 100'),
        reason: 'Expected output to contain "Data received: 100" when stream emits data');
  });

  test('Program should handle errors and print "Error occurred."', () async {
    final output = await runMain();
    expect(output, contains('Error occurred.'),
        reason: 'Expected output to contain "Error occurred." when stream emits an error');
  });

  test('Program should handle completion and print "Stream is now closed."',
      () async {
    final output = await runMain();
    expect(output, contains('Stream is now closed.'),
        reason: 'Expected output to contain "Stream is now closed." when stream completes');
  });

  test('Program should use listen() method with onError parameter', () async {
    final code = await getUserCode();
    final pattern = RegExp(r'onError\s*:', multiLine: true);
    expect(code, matches(pattern),
        reason: 'Expected code to use listen() method with onError parameter to handle stream errors');
  });

  test('Program should use listen() method with onDone parameter', () async {
    final code = await getUserCode();
    final pattern = RegExp(r'onDone\s*:', multiLine: true);
    expect(code, matches(pattern),
        reason: 'Expected code to use listen() method with onDone parameter to handle stream completion');
  });
}

