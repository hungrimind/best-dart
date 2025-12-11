class Product {
  final String name;
  final String category;

  // TODO: Add constructor with initializer list
  // The name should be converted to uppercase
  // The category should be converted to lowercase
  Product(String name, String category) : name = name, category = category;

  @override
  String toString() => 'Product(name: $name, category: $category)';
}

void main() {
  final product1 = Product('laptop', 'ELECTRONICS');
  print(product1);
  // Expected output: Product(name: LAPTOP, category: electronics)

  final product2 = Product('tablet', 'COMPUTERS');
  print(product2);
  // Expected output: Product(name: TABLET, category: computers)
}
