import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/product/data/models/product_model.dart';

class ProductLocalDataSource {
  final AppDatabase db;

  ProductLocalDataSource(this.db);

  Future<List<ProductModel>> getProducts() async {
    try {
      final data = await db.getProducts();
      return data.map(_toModel).toList();
    } catch (e) {
      throw Exception("Database error $e");
    }
  }

  Future<void> add(ProductModel product) async {
    try {
      await db
          .into(db.products)
          .insert(
            ProductsCompanion.insert(
              id: product.id,
              name: product.name,
              price: product.price,
              stock: product.stock,
              barcode: product.barcode,
              categoryId: product.categoryId,
            ),
          );
    } on SqliteException catch (e) {
      // 🔴 UNIQUE constraint violation (duplicate barcode)
      if (e.extendedResultCode == 2067 || e.message.contains("UNIQUE")) {
        throw Exception("DUPLICATE_BARCODE");
      }

      // 🔴 other SQLite errors
      throw Exception("DATABASE_ERROR: ${e.message}");
    } catch (e) {
      // 🔴 unknown errors
      throw Exception("UNKNOWN_ERROR: $e");
    }
  }

  Future<void> update(ProductModel product) async {
    try {
      await db.updateProduct(_toTable(product));
    } catch (e) {
      throw Exception("Database error $e");
    }
  }

  Future<void> delete(String id) async {
    try {
      await db.deleteProduct(id);
    } catch (e) {
      throw Exception("Database error $e");
    }
  }

  Future<ProductModel?> findByBarcode(String barcode) async {
    try {
      final result = await db.findByBarcode(barcode);
      return result != null ? _toModel(result) : null;
    } catch (e) {
      throw Exception("Database error $e");
    }
  }

  Future<List<ProductModel>> search(String query) async {
    try {
      final result =
          await (db.select(db.products)..where(
                (tbl) =>
                    tbl.name.like('%$query%') | tbl.barcode.like('%$query%'),
              ))
              .get();

      return result.map(_toModel).toList();
    } catch (e) {
      throw Exception("Database search failed: $e");
    }
  }

  // -------- MAPPERS --------

  ProductModel _toModel(Product data) {
    return ProductModel(
      id: data.id,
      name: data.name,
      barcode: data.barcode,
      price: data.price,
      stock: data.stock,
      categoryId: data.categoryId,
    );
  }

  ProductsCompanion _toCompanion(ProductModel model) {
    return ProductsCompanion.insert(
      id: model.id,
      name: model.name,
      barcode: model.barcode,
      price: model.price,
      stock: model.stock,
      categoryId: model.categoryId,
    );
  }

  Product _toTable(ProductModel model) {
    return Product(
      id: model.id,
      name: model.name,
      barcode: model.barcode,
      price: model.price,
      stock: model.stock,
      categoryId: model.categoryId,
    );
  }
}
