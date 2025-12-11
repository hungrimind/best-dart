import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('Document save() method prints correct message', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/method_override.dart',
    ], runInShell: true);

    expect(
      result.stdout.toString(),
      contains('Saving the document to a file...'),
      reason:
          'Document class should print "Saving the document to a file..." when save() is called',
    );
  });

  test(
    'Receipt save() method overrides parent and prints correct message',
    () async {
      final result = await Process.run('dart', [
        'run',
        'bin/method_override.dart',
      ], runInShell: true);

      expect(
        result.stdout.toString(),
        contains('Saving the receipt to the accounting system...'),
        reason:
            'Receipt class should override save() and print "Saving the receipt to the accounting system..."',
      );
    },
  );

  test(
    'Both Document and Receipt save() methods are called correctly',
    () async {
      final result = await Process.run('dart', [
        'run',
        'bin/method_override.dart',
      ], runInShell: true);

      final output = result.stdout.toString();

      expect(
        output,
        contains('Saving the document to a file...'),
        reason: 'Document save() should be called and print its message',
      );

      expect(
        output,
        contains('Saving the receipt to the accounting system...'),
        reason: 'Receipt save() should override and print its specific message',
      );

      // Verify Receipt uses its own implementation
      final lines = output.split('\n');
      final receiptSaveIndex = lines.indexWhere(
        (line) =>
            line.contains('Saving the receipt to the accounting system...'),
      );

      // Receipt should use its own implementation, not the parent's
      expect(
        receiptSaveIndex,
        greaterThan(-1),
        reason: 'Receipt must override save() with its own implementation',
      );
    },
  );
}
