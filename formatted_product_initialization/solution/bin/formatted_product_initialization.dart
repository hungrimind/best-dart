class Product {
  final String name;
  final double price;

  Product(String name, double price)
      : name = name.toUpperCase(),
        price = price < 0 ? 0.0 : price;

  @override
  String toString() => 'Product(name: $name, price: $price)';
}

void main() {
  final product1 = Product('laptop', 999.99);
  print(product1);
  // Output: Product(name: LAPTOP, price: 999.99)

  final product2 = Product('tablet', -100.0);
  print(product2);
  // Output: Product(name: TABLET, price: 0.0)
}

