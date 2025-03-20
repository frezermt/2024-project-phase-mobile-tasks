import 'package:product_2/models/product.dart';

class ProductManager {
  List<Product> _products = [];

  // Add product
  void add(String name, String description, double price) {
    _products.add(Product(name, description, price));
    print('Product added successfully.');
  }

  // View all products
  List<Product> view() {
    return _products;
  }

  // View a single product by index
  Product viewProduct(int index) {
    if (index >= 0 && index < _products.length) {
      return _products[index];
    } else {
      throw Exception('Product not found');
    }
  }

  // Edit a product
  void edit(int index, String name, String description, double price) {
    if (index >= 0 && index < _products.length) {
      _products[index].name = name;
      _products[index].description = description;
      _products[index].price = price;
      print('Product updated successfully.');
    } else {
      throw Exception('Product not found');
    }
  }

  // Delete a product
  void delete(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
      print('Product deleted successfully.');
    } else {
      throw Exception('Product not found');
    }
  }
}
