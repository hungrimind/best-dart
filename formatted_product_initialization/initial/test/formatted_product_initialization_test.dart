import 'package:test/test.dart';
import '../bin/formatted_product_initialization.dart';

void main() {
  group('Product Initializer List Tests', () {
    test('name should be converted to uppercase', () {
      final product = Product('laptop', 999.99);
      expect(
        product.name,
        equals('LAPTOP'),
        reason: 'Product name should be stored in uppercase format',
      );
    });

    test('name with mixed case should be converted to uppercase', () {
      final product = Product('SmartPhone', 599.50);
      expect(
        product.name,
        equals('SMARTPHONE'),
        reason: 'Product name with mixed case should be converted to uppercase',
      );
    });

    test('negative price should be set to 0.0', () {
      final product = Product('tablet', -100.0);
      expect(
        product.price,
        equals(0.0),
        reason: 'Negative price should be validated and set to 0.0',
      );
    });

    test('positive price should be preserved', () {
      final product = Product('monitor', 299.99);
      expect(
        product.price,
        equals(299.99),
        reason: 'Positive price should be preserved as provided',
      );
    });

    test('zero price should be preserved', () {
      final product = Product('free_item', 0.0);
      expect(
        product.price,
        equals(0.0),
        reason: 'Zero price should be preserved',
      );
    });

    test('both name formatting and price validation work together', () {
      final product = Product('MixedCase', -50.0);
      expect(
        product.name,
        equals('MIXEDCASE'),
        reason: 'Name should be uppercase',
      );
      expect(
        product.price,
        equals(0.0),
        reason: 'Negative price should be set to 0.0',
      );
    });
  });
}
