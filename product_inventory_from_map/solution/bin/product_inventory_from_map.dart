class Product {
  String? name;
  double? price;

  Product(this.name, this.price);

  Product.fromMap(
    Map<String, dynamic> productData, {
    String? name,
    double? price,
  }) : name = name ?? productData['name'] as String?,
       price = price ?? productData['price'] as double?;
}

void main() {
  final productData = {'name': 'Laptop', 'price': 1200.0};

  final product = Product.fromMap(productData);

  print('Product Name: ${product.name}');
  print('Product Price: \$${product.price}');

  final customProduct = Product.fromMap(
    productData,
    name: 'Desktop',
    price: 1500.0,
  );
  print('\nCustom Product Name: ${customProduct.name}');
  print('Custom Product Price: \$${customProduct.price}');
}
