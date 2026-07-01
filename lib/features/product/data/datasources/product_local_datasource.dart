import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/database/providers/app_database_provider.dart';

abstract class ProductLocalDataSource {
  // Product
  Future<List<Product>> getProducts();

  Future<Product?> getProductById(String id);

  Future<void> addProduct(ProductsCompanion product);

  Future<void> updateProduct(Product product);

  Future<void> deleteProduct(String id);

  Future<List<Product>> searchProducts(String query);

  // Variant
  Future<List<ProductVariant>> getVariants(String productId);

  Future<ProductVariant?> getVariantById(String id);

  Future<void> addVariant(ProductVariantsCompanion variant);

  Future<void> updateVariant(ProductVariant variant);

  Future<void> deleteVariant(String id);

  Future<ProductVariant?> findByBarcode(String barcode);

  Future<ProductVariant?> findBySku(String sku);

  Future<void> addProductWithVariant(
    ProductsCompanion product,
    List<ProductVariantsCompanion> variants,
  );
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final AppDatabase _database;

  ProductLocalDataSourceImpl(this._database);

  //==========================================================
  // add product with PRODUCT
  //==========================================================

  @override
  Future<void> addProductWithVariant(
    ProductsCompanion product,
    List<ProductVariantsCompanion> variants,
  ) async {
    await _database.transaction(() async {
      await _database
          .into(_database.products)
          .insert(product, mode: InsertMode.insertOrAbort);

      for (final v in variants) {
        await _database
            .into(_database.productVariants)
            .insert(v, mode: InsertMode.insertOrAbort);
      }
    });
  }

  //==========================================================
  // PRODUCT
  //==========================================================

  @override
  Future<List<Product>> getProducts() async {
    return await _database.select(_database.products).get();
  }

  @override
  Future<Product?> getProductById(String id) async {
    return await (_database.select(
      _database.products,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<void> addProduct(ProductsCompanion product) async {
    await _database
        .into(_database.products)
        .insert(product, mode: InsertMode.insertOrAbort);
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _database.update(_database.products).replace(product);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await (_database.delete(
      _database.products,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    return await (_database.select(
      _database.products,
    )..where((tbl) => tbl.name.like('%$query%'))).get();
  }

  //==========================================================
  // PRODUCT VARIANT
  //==========================================================

  @override
  Future<List<ProductVariant>> getVariants(String productId) async {
    return await (_database.select(
      _database.productVariants,
    )..where((tbl) => tbl.productId.equals(productId))).get();
  }

  @override
  Future<ProductVariant?> getVariantById(String id) async {
    return await (_database.select(
      _database.productVariants,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<void> addVariant(ProductVariantsCompanion variant) async {
    await _database
        .into(_database.productVariants)
        .insert(variant, mode: InsertMode.insertOrAbort);
  }

  @override
  Future<void> updateVariant(ProductVariant variant) async {
    await _database.update(_database.productVariants).replace(variant);
  }

  @override
  Future<void> deleteVariant(String id) async {
    await (_database.delete(
      _database.productVariants,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<ProductVariant?> findByBarcode(String barcode) async {
    return await (_database.select(
      _database.productVariants,
    )..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
  }

  @override
  Future<ProductVariant?> findBySku(String sku) async {
    return await (_database.select(
      _database.productVariants,
    )..where((tbl) => tbl.sku.equals(sku))).getSingleOrNull();
  }
}

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>(
  (ref) => ProductLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
