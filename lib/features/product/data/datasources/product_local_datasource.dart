import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/database/providers/app_database_provider.dart';

abstract class ProductLocalDataSource {
  // Product
  Future<List<Product>> getProducts({required int limit, required int page});

  Future<Product?> getProductById(String id);

  Future<void> addProduct(ProductsCompanion product);

  Future<void> updateProduct(Product product);

  Future<void> deleteProduct(String id);
  Future<int> getProductCount();
  Future<int> getVariantsCount();

  Future<List<Product>> searchProducts(String query);
  Future<List<ProductVariant>> searchProductVariants(String query);

  // Variant
  Future<List<ProductVariant>> getVariantsList({
    required int limit,
    required int page,
  });
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

  Future<void> updateProductWithVariants(
    Product product,
    List<ProductVariant> variants,
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
  Future<List<Product>> getProducts({
    required int limit,
    required int page,
  }) async {
    final offset = (page - 1) * limit;
    return await (_database.select(_database.products)
          ..where((tbl) => tbl.isActive.equals(true))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  // @override
  // Future<Product?> getProductById(String id) async {
  //   return await (_database.select(
  //     _database.products,
  //   )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  // }

  @override
  Future<Product?> getProductById(String id) async {
    return await (_database.select(_database.products)
          ..where((tbl) => tbl.id.equals(id) & tbl.isActive.equals(true)))
        .getSingleOrNull();
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

  // @override
  // Future<void> deleteProduct(String id) async {
  //   await (_database.delete(
  //     _database.products,
  //   )..where((tbl) => tbl.id.equals(id))).go();
  // }

  @override
  Future<void> deleteProduct(String id) async {
    await (_database.update(
      _database.products,
    )..where((tbl) => tbl.id.equals(id))).write(
      ProductsCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );

    // Also deactivate all variants of this product
    await (_database.update(
      _database.productVariants,
    )..where((tbl) => tbl.productId.equals(id))).write(
      ProductVariantsCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // @override
  // Future<List<Product>> searchProducts(String query) async {
  //   return await (_database.select(
  //     _database.products,
  //   )..where((tbl) => tbl.name.like('%$query%'))).get();
  // }

  @override
  Future<List<Product>> searchProducts(String query) async {
    return await (_database.select(_database.products)..where(
          (tbl) => tbl.name.like('%$query%') & tbl.isActive.equals(true),
        ))
        .get();
  }

  //==========================================================
  // PRODUCT VARIANT
  //==========================================================

  // @override
  // Future<List<ProductVariant>> getVariants(String productId) async {
  //   return await (_database.select(
  //     _database.productVariants,
  //   )..where((tbl) => tbl.productId.equals(productId))).get();
  // }

  @override
  Future<List<ProductVariant>> getVariantsList({
    required int limit,
    required int page,
  }) async {
    final offset = (page - 1) * limit;

    return await (_database.select(_database.productVariants)
          ..where((tbl) => tbl.isActive.equals(true))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  @override
  Future<List<ProductVariant>> getVariants(String productId) async {
    final query = _database.select(_database.productVariants).join([
      innerJoin(
        _database.products,
        _database.products.id.equalsExp(_database.productVariants.productId),
      ),
    ]);

    query.where(
      _database.productVariants.productId.equals(productId) &
          _database.productVariants.isActive.equals(true) &
          _database.products.isActive.equals(true),
    );

    final rows = await query.get();

    return rows.map((row) => row.readTable(_database.productVariants)).toList();
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

  // @override
  // Future<void> deleteVariant(String id) async {
  //   await (_database.delete(
  //     _database.productVariants,
  //   )..where((tbl) => tbl.id.equals(id))).go();
  // }

  @override
  Future<void> deleteVariant(String id) async {
    await (_database.update(
      _database.productVariants,
    )..where((tbl) => tbl.id.equals(id))).write(
      ProductVariantsCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // @override
  // Future<ProductVariant?> findByBarcode(String barcode) async {
  //   return await (_database.select(
  //     _database.productVariants,
  //   )..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
  // }

  @override
  Future<ProductVariant?> findByBarcode(String barcode) async {
    final query = _database.select(_database.productVariants).join([
      innerJoin(
        _database.products,
        _database.products.id.equalsExp(_database.productVariants.productId),
      ),
    ]);

    query.where(
      _database.productVariants.barcode.equals(barcode) &
          _database.productVariants.isActive.equals(true) &
          _database.products.isActive.equals(true),
    );

    final row = await query.getSingleOrNull();

    return row?.readTable(_database.productVariants);
  }

  //   @override
  //   Future<ProductVariant?> findBySku(String sku) async {
  //     return await (_database.select(
  //       _database.productVariants,
  //     )..where((tbl) => tbl.sku.equals(sku))).getSingleOrNull();
  //   }

  @override
  Future<ProductVariant?> findBySku(String sku) async {
    final query = _database.select(_database.productVariants).join([
      innerJoin(
        _database.products,
        _database.products.id.equalsExp(_database.productVariants.productId),
      ),
    ]);

    query.where(
      _database.productVariants.sku.equals(sku) &
          _database.productVariants.isActive.equals(true) &
          _database.products.isActive.equals(true),
    );

    final row = await query.getSingleOrNull();

    return row?.readTable(_database.productVariants);
  }

  @override
  Future<int> getProductCount() async {
    final countExp = _database.products.id.count();

    final query = _database.selectOnly(_database.products)
      ..addColumns([countExp])
      ..where(_database.products.isActive.equals(true));

    final result = await query.getSingle();

    return result.read(countExp) ?? 0;
  }

  // update product with variants

  @override
  Future<void> updateProductWithVariants(
    Product product,
    List<ProductVariant> variants,
  ) async {
    await _database.transaction(() async {
      // Update product
      await _database.update(_database.products).replace(product);

      // Existing variants in database
      final existingVariants = await (_database.select(
        _database.productVariants,
      )..where((tbl) => tbl.productId.equals(product.id))).get();

      final existingIds = existingVariants.map((e) => e.id).toSet();
      final incomingIds = variants.map((e) => e.id).toSet();

      // Update existing / Insert new
      for (final variant in variants) {
        if (existingIds.contains(variant.id)) {
          await _database.update(_database.productVariants).replace(variant);
        } else {
          await _database
              .into(_database.productVariants)
              .insert(variant.toCompanion(true));
        }
      }

      // Soft delete removed variants
      final removedIds = existingIds.difference(incomingIds);

      if (removedIds.isNotEmpty) {
        await (_database.update(
          _database.productVariants,
        )..where((tbl) => tbl.id.isIn(removedIds))).write(
          ProductVariantsCompanion(
            isActive: const Value(false),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }
    });
  }

  @override
  Future<int> getVariantsCount() async {
    final countExp = _database.productVariants.id.count();

    final query = _database.selectOnly(_database.productVariants)
      ..addColumns([countExp])
      ..where(_database.productVariants.isActive.equals(true));

    final result = await query.getSingle();

    return result.read(countExp) ?? 0;
  }

  @override
  Future<List<ProductVariant>> searchProductVariants(String query) async {
    return await (_database.select(_database.productVariants)..where(
          (tbl) =>
              tbl.size.like('%$query%') |
              tbl.barcode.like('%$query%') |
              tbl.sku.like('%$query%') & tbl.isActive.equals(true),
        ))
        .get();
  }
}

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>(
  (ref) => ProductLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
