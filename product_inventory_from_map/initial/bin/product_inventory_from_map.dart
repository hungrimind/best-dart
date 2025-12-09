class Product {
  String name;
  double price;

  Product(this.name, this.price);

  // Create a named constructor called fromMap that accepts a Map<String, dynamic> parameter named productData.
  // Use the values from the productData map to initialize the name and price properties.
  // The map will contain a 'name' key with a String value and a 'price' key with a double value.
}

void main() {
  final productData = {'name': 'Laptop', 'price': 1200.0};

  // Use the Product.fromMap named constructor to create a Product object from the productData map.

  // Print the product name and price to verify the object was created correctly.
}

