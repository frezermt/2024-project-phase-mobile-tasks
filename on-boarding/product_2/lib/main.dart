import 'dart:io';
import 'package:product_2/managers/product_manager.dart';
import 'package:product_2/models/product.dart';

void main() {
  ProductManager manager = ProductManager();
  while (true) {
    print('Please Enter your choice');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View a Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter product name');
        String name = stdin.readLineSync()!;
        print('Enter product description');
        String description = stdin.readLineSync()!;
        print('Enter product price');
        double price = double.parse(stdin.readLineSync()!);

        manager.add(name, description, price);
        break;

      case '2':
        List<Product> products = manager.view();
        if (products.isEmpty) {
          print('No products available.');
        } else {
          products.forEach((product) {
            print(
                'Name: ${product.name}, Description: ${product.description}, Price: ${product.price}');
          });
        }
        break;

      case '3':
        print('Please Enter product index');
        int index = int.parse(stdin.readLineSync()!);
        try {
          var product = manager.viewProduct(index);
          print(
              'Name: ${product.name}, Description: ${product.description}, Price: ${product.price}');
        } catch (e) {
          print(e);
        }
        break;

      case '4':
        print('Please Enter the index of the product that you want to edit');
        int index = int.parse(stdin.readLineSync()!);
        print('Enter the new name');
        String name = stdin.readLineSync()!;
        print('Enter the new description');
        String description = stdin.readLineSync()!;
        print('Enter the new price');
        double price = double.parse(stdin.readLineSync()!);

        manager.edit(index, name, description, price);
        break;

      case '5':
        print('Enter index of the product you want to delete');
        int index = int.parse(stdin.readLineSync()!);
        try {
          manager.delete(index);
        } catch (e) {
          print(e);
        }
        break;

      case '6':
        print('Exiting');
        return;

      default:
        print('Invalid choice. Please select again.');
    }
  }
}
