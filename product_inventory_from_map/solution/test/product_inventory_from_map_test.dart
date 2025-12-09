import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('should run without errors', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/product_inventory_from_map.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason:
          'The program should run without errors. Make sure you have created the Product class with a fromMap named constructor.',
    );
  });

  test('should create Product from map with correct name', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/product_inventory_from_map.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Product Name: Laptop'),
      reason:
          'The Product.fromMap constructor should extract the name from the map. Make sure you are accessing the "name" key from the productData map.',
    );
  });

  test('should create Product from map with correct price', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/product_inventory_from_map.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Product Price: \$1200.0'),
      reason:
          'The Product.fromMap constructor should extract the price from the map. Make sure you are accessing the "price" key from the productData map.',
    );
  });

  test('should print both name and price', () async {
    final result = await Process.run('dart', [
      'run',
      'bin/product_inventory_from_map.dart',
    ], runInShell: true);

    expect(
      result.exitCode,
      0,
      reason: 'The program should run without errors.',
    );

    final output = result.stdout.toString();

    expect(
      output,
      contains('Product Name: Laptop'),
      reason: 'The program should print the product name.',
    );

    expect(
      output,
      contains('Product Price: \$1200.0'),
      reason: 'The program should print the product price.',
    );
  });
}

