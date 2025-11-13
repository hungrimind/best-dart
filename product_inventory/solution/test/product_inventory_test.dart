import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('populates inventory map correctly', () async {
    final result = await Process.run('dart', ['bin/product_inventory.dart']);

    expect(
      result.exitCode,
      equals(0),
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    // Verify all required products are present
    expect(
      output,
      contains('Apples'),
      reason: 'The inventory map should contain Apples.',
    );

    expect(
      output,
      contains('Oranges'),
      reason: 'The inventory map should contain Oranges.',
    );

    expect(
      output,
      contains('Bananas'),
      reason: 'The inventory map should contain Bananas.',
    );

    // Verify quantities are correct
    expect(
      output,
      contains('10'),
      reason: 'The inventory map should contain Apples with quantity 10.',
    );

    expect(
      output,
      contains('25'),
      reason: 'The inventory map should contain Oranges with quantity 25.',
    );

    expect(
      output,
      contains('15'),
      reason: 'The inventory map should contain Bananas with quantity 15.',
    );
  });
}
