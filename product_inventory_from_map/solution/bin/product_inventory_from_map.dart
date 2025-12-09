class Product {
  String name;
  double price;

  Product(this.name, this.price);

  Product.fromMap(Map<String, dynamic> productData)
      : name = productData['name'] as String,
        price = productData['price'] as double;
}

void main() {
  final productData = {'name': 'Laptop', 'price': 1200.0};

  final product = Product.fromMap(productData);

  print('Product Name: ${product.name}');
  print('Product Price: \$${product.price}');
}

