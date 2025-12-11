class Product {
  final String name;
  final String category;

  Product(String name, String category)
    : name = name.toUpperCase(),
      category = category.toLowerCase();

  @override
  String toString() => 'Product(name: $name, category: $category)';
}

void main() {
  final product1 = Product('laptop', 'ELECTRONICS');
  print(product1);
  // Output: Product(name: LAPTOP, category: electronics)

  final product2 = Product('tablet', 'COMPUTERS');
  print(product2);
  // Output: Product(name: TABLET, category: computers)
}
