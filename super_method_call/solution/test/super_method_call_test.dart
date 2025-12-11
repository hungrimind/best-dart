import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('SalesReport generate method', () {
    test('should call parent Report.generate() method using super',
        () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/super_method_call.dart'],
        runInShell: true,
      );

      expect(
        result.stdout.toString(),
        contains('Generating report header and footer.'),
        reason:
            'SalesReport.generate() must call super.generate() to include the parent Report header and footer',
      );
    });

    test('should add sales-specific content after parent method call',
        () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/super_method_call.dart'],
        runInShell: true,
      );

      expect(
        result.stdout.toString(),
        contains('Adding sales data and charts.'),
        reason:
            'SalesReport.generate() must add sales-specific content after calling the parent method',
      );
    });

    test('should output parent content before sales content', () async {
      final result = await Process.run(
        'dart',
        ['run', 'bin/super_method_call.dart'],
        runInShell: true,
      );

      final output = result.stdout.toString();
      final headerIndex = output.indexOf('Generating report header and footer.');
      final salesIndex = output.indexOf('Adding sales data and charts.');

      expect(
        headerIndex,
        lessThan(salesIndex),
        reason:
            'super.generate() must be called before adding sales content to ensure correct output order',
      );
    });
  });
}


