import 'package:test/test.dart';
import '../bin/formatted_product_initialization.dart';

void main() {
  group('Product Initializer List Tests', () {
    test('name should be converted to uppercase', () {
      final product = Product('laptop', 'ELECTRONICS');
      expect(
        product.name,
        equals('LAPTOP'),
        reason: 'Product name should be stored in uppercase format',
      );
    });

    test('category should be converted to lowercase', () {
      final product = Product('tablet', 'ELECTRONICS');
      expect(
        product.category,
        equals('electronics'),
        reason: 'Product category should be stored in lowercase format',
      );
    });

    test('both name and category formatting work together', () {
      final product = Product('SmartPhone', 'COMPUTERS');
      expect(
        product.name,
        equals('SMARTPHONE'),
        reason: 'Name should be uppercase',
      );
      expect(
        product.category,
        equals('computers'),
        reason: 'Category should be lowercase',
      );
    });
  });
}
