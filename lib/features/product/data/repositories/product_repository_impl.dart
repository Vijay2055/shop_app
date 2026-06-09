import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/data/datasources/product_local_datasource.dart';
import 'package:shop_app/features/product/data/models/product_model.dart';
import 'package:shop_app/features/product/domain/entities/product.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Product>>> getProducts() async {
    try {
      final data = await dataSource.getProducts();
      return Result.success(data);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> addProduct(Product product) async {
    try {
      await dataSource.add(_toModel(product));
      return Result.success(null);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateProduct(Product product) async {
    try {
      await dataSource.update(_toModel(product));
      return Result.success(null);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteProduct(String id) async {
    try {
      await dataSource.delete(id);
      return Result.success(null);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<Product?>> findByBarcode(String barcode) async {
    try {
      final data = await dataSource.findByBarcode(barcode);
      return Result.success(data);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<Product>>> searchProducts(String query) async {
    try {
      final data = await dataSource.search(query);
      return Result.success(data);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // -------- Mapper --------

  ProductModel _toModel(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      stock: product.stock,
      barcode: product.barcode,
      categoryId: product.categoryId
    );
  }
}
