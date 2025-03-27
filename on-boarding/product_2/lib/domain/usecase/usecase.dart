import 'package:product_2/domain/entiites/product.dart';
import 'package:product_2/domain/repository/repository.dart';

abstract class UseCase<ReturnType, Params> {
  ReturnType call(Params params);
}

class ViewAllProductsUsecase extends UseCase<List<Product>, void> {
  final ProductRepositoryInterface repository;

  ViewAllProductsUsecase(this.repository);

  @override
  List<Product> call(void params) {
    return repository.getAllProducts();
  }
}

class ViewProductUsecase extends UseCase<Product?, String> {
  final ProductRepositoryInterface repository;

  ViewProductUsecase(this.repository);

  @override
  Product? call(String params) {
    return repository.getProductById(params);
  }
}

class CreateProductUsecase extends UseCase<void, Product> {
  final ProductRepositoryInterface repository;

  CreateProductUsecase(this.repository);

  @override
  void call(Product params) {
    repository.addProduct(params);
  }
}

class UpdateProductUsecase extends UseCase<void, Product> {
  final ProductRepositoryInterface repository;

  UpdateProductUsecase(this.repository);

  @override
  void call(Product params) {
    repository.updateProduct(params);
  }
}

class DeleteProductUsecase extends UseCase<void, String> {
  final ProductRepositoryInterface repository;

  DeleteProductUsecase(this.repository);

  @override
  void call(String params) {
    repository.deleteProduct(params);
  }
}