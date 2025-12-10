import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('StreamController add - Order status updates', () {
    test('should output all three status updates in correct order', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/stream_controller_sink.dart',
      ], runInShell: true);

      expect(
        result.exitCode,
        equals(0),
        reason: 'Program should run successfully without errors',
      );

      final output = result.stdout.toString().trim();
      final lines = output
          .split('\n')
          .where((line) => line.isNotEmpty)
          .toList();

      expect(
        lines.length,
        equals(3),
        reason:
            'Should output exactly 3 status updates, but got ${lines.length}',
      );

      expect(
        lines[0],
        equals('Order received'),
        reason: 'First status should be "Order received"',
      );

      expect(
        lines[1],
        equals('Processing item'),
        reason: 'Second status should be "Processing item"',
      );

      expect(
        lines[2],
        equals('Shipped'),
        reason: 'Third status should be "Shipped"',
      );
    });

    test('should output "Order received" as first status', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/stream_controller_sink.dart',
      ], runInShell: true);

      final output = result.stdout.toString().trim();
      final lines = output
          .split('\n')
          .where((line) => line.isNotEmpty)
          .toList();

      expect(
        lines.isNotEmpty && lines[0] == 'Order received',
        isTrue,
        reason: 'First status update must be "Order received"',
      );
    });

    test('should output all status updates using add', () async {
      final result = await Process.run('dart', [
        'run',
        'bin/stream_controller_sink.dart',
      ], runInShell: true);

      final output = result.stdout.toString().trim();
      final lines = output
          .split('\n')
          .where((line) => line.isNotEmpty)
          .toList();

      expect(
        lines.contains('Order received') &&
            lines.contains('Processing item') &&
            lines.contains('Shipped'),
        isTrue,
        reason:
            'All three status updates must be present in the output: "Order received", "Processing item", and "Shipped"',
      );
    });
  });
}
