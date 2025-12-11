class Product {
  String? name;
  double? price;

  Product(this.name, this.price);

  // Create a named constructor called fromMap that accepts a Map<String, dynamic> and optional named parameters.
}

void main() {
  final productData = {'name': 'Laptop', 'price': 1200.0};

  // Use Product.fromMap to create a Product object and print the name and price.
}
