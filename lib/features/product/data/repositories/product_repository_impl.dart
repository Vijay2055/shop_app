import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/data/datasources/product_local_datasource.dart';
import 'package:shop_app/features/product/data/models/product_model.dart';
import 'package:shop_app/features/product/data/models/product_variant_model.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource _localDataSource;

  ProductRepositoryImpl(this._localDataSource);

  //==========================================================
  // Product
  //==========================================================

  @override
  Future<Result<List<ProductEntity>>> getProducts({
    required int limit,
    required int page,
  }) async {
    try {
      final rows = await _localDataSource.getProducts(limit: limit, page: page);

      final products = rows.map((e) => e.toModel().toEntity()).toList();

      return Success(products);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductEntity?>> getProductById(String id) async {
    try {
      final row = await _localDataSource.getProductById(id);

      return Success(row?.toModel().toEntity());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> searchProducts(String query) async {
    try {
      final rows = await _localDataSource.searchProducts(query);

      final products = rows.map((e) => e.toModel().toEntity()).toList();

      return Success(products);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> addProduct(ProductEntity product) async {
    try {
      final model = ProductModel.fromEntity(product);

      await _localDataSource.addProduct(model.toCompanion());

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateProduct(ProductEntity product) async {
    try {
      final model = ProductModel.fromEntity(product);

      await _localDataSource.updateProduct(model.toDrift());

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteProduct(String productId) async {
    try {
      await _localDataSource.deleteProduct(productId);

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  //==========================================================
  // Variant
  //==========================================================

  @override
  Future<Result<List<ProductVariantEntity>>> getVarientList({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _localDataSource.getVariantsList(
        limit: limit,
        page: page,
      );
      final data = result.map((item) => item.toModel().toEntity()).toList();
      return Success(data);
    } catch (e) {
      return FailureResult(DatabaseFailure("Can't load variants:: $e"));
    }
  }

  @override
  Future<Result<List<ProductVariantEntity>>> getVariants(
    String productId,
  ) async {
    try {
      final rows = await _localDataSource.getVariants(productId);

      final variants = rows.map((e) => e.toModel().toEntity()).toList();

      return Success(variants);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductVariantEntity?>> getVariantById(String variantId) async {
    try {
      final row = await _localDataSource.getVariantById(variantId);

      return Success(row?.toModel().toEntity());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> addVariant(ProductVariantEntity variant) async {
    try {
      final model = ProductVariantModel.fromEntity(variant);

      await _localDataSource.addVariant(model.toCompanion());

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateVariant(ProductVariantEntity variant) async {
    try {
      final model = ProductVariantModel.fromEntity(variant);

      await _localDataSource.updateVariant(model.toDrift());

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteVariant(String variantId) async {
    try {
      await _localDataSource.deleteVariant(variantId);

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductVariantEntity>> findByBarcode(String barcode) async {
    try {
      final row = await _localDataSource.findByBarcode(barcode);

      if (row == null) {
        return FailureResult(DatabaseFailure('Product not found'));
      }
      if (row.stock <= 0) {
        return FailureResult(DatabaseFailure('Product is out of stock'));
      }

      return Success(row.toModel().toEntity());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductVariantEntity?>> findBySku(String sku) async {
    try {
      final row = await _localDataSource.findBySku(sku);

      return Success(row?.toModel().toEntity());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> addProductWithVariant(
    ProductEntity product,
    List<ProductVariantEntity> variants,
  ) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      final variantModels = variants
          .map((v) => ProductVariantModel.fromEntity(v))
          .toList();

      final productCompanion = productModel.toCompanion();
      final variantCompanions = variantModels
          .map((v) => v.toCompanion())
          .toList();

      await _localDataSource.addProductWithVariant(
        productCompanion,
        variantCompanions,
      );
      print("Added");

      return const Success(null);
    } catch (e) {
      print(e.toString());
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<int>> getProductCounts() async {
    try {
      final data = await _localDataSource.getProductCount();
      return Success(data);
    } catch (e) {
      print(e.toString());
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateProductWithVariant(
    ProductEntity product,
    List<ProductVariantEntity> variants,
  ) async {
    // TODO: implement updateProductWithVariant
    try {
      final productModel = ProductModel.fromEntity(product);
      final variantModels = variants
          .map((v) => ProductVariantModel.fromEntity(v).toDrift())
          .toList();

      await _localDataSource.updateProductWithVariants(
        productModel.toDrift(),
        variantModels,
      );

      print("Added");

      return const Success(null);
    } catch (e) {
      print(e.toString());
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<int>> getProductVariantCount() async {
    try {
      final counts = await _localDataSource.getVariantsCount();

      return Success(counts);
    } catch (e) {
      return FailureResult(DatabaseFailure("Can't get variant count:: $e"));
    }
  }

  @override
  Future<Result<List<ProductVariantEntity>>> searchProductVariants(
    String query,
  ) async {
    try {
      final result = await _localDataSource.searchProductVariants(query);
      final parsedData = result
          .map((product) => product.toModel().toEntity())
          .toList();

      return Success(parsedData);
    } catch (e) {
      return FailureResult(
        DatabaseFailure("Can't search product variant due to :: $e"),
      );
    }
  }
}

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => ProductRepositoryImpl(ref.watch(productLocalDataSourceProvider)),
);
