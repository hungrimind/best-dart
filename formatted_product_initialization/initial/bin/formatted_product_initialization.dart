class Product {
  final String name;
  final double price;

  // TODO: Add constructor with initializer list
  // The name should be converted to uppercase
  // The price should be validated: if negative, set to 0.0
  Product(String name, double price)
      : name = name,
        price = price;

  @override
  String toString() => 'Product(name: $name, price: $price)';
}

void main() {
  final product1 = Product('laptop', 999.99);
  print(product1);
  // Expected output: Product(name: LAPTOP, price: 999.99)

  final product2 = Product('tablet', -100.0);
  print(product2);
  // Expected output: Product(name: TABLET, price: 0.0)
}

