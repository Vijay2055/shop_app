import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_app/core/database/tables/history_table.dart';
import 'package:shop_app/core/database/tables/purchase_item_table.dart';
import 'package:shop_app/core/database/tables/udhar_table.dart';
import 'package:shop_app/core/database/tables/counter_table.dart';
import 'package:shop_app/features/category/domain/models/category_with_count.dart';
import 'package:shop_app/core/database/tables/category_tables.dart';

import 'tables/product_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Products,
    Categories,
    UdharTable,
    HistoryTable,
    PurchaseItemTable,
    CounterTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll(); // create all tables
    },

    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 4) {
        await m.addColumn(historyTable, historyTable.status);
      }
    },
  );

  // -------- CRUD --------

  Future<List<Product>> getProducts() => select(products).get();

  Future<Product?> findByBarcode(String barcode) {
    return (select(
      products,
    )..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
  }

  Future<void> insertProduct(ProductsCompanion product) =>
      into(products).insert(product);

  Future<void> updateProduct(Product product) =>
      update(products).replace(product);

  Future<void> deleteProduct(String id) =>
      (delete(products)..where((tbl) => tbl.id.equals(id))).go();
  // for category

  // -------- CATEGORY CRUD --------
  // 🔥 GET WITH COUNT (OPTIMIZED)
  Future<List<CategoryWithCount>> getCategoriesWithCount() async {
    final query = select(categories).join([
      leftOuterJoin(products, products.categoryId.equalsExp(categories.id)),
    ]);

    final rows = await query.get();

    final map = <String, CategoryWithCount>{};

    for (final row in rows) {
      final category = row.readTable(categories);
      final product = row.readTableOrNull(products);

      final existing = map.putIfAbsent(
        category.id,
        () => CategoryWithCount(category: category, productCount: 0),
      );

      if (product != null) {
        existing.productCount++;
      }
    }

    return map.values.toList();
  }

  // 🔥 REAL-TIME STREAM (VERY IMPORTANT FOR POS UI)
  Stream<List<CategoryWithCount>> watchCategoriesWithCount() {
    final query = select(categories).join([
      leftOuterJoin(products, products.categoryId.equalsExp(categories.id)),
    ]);

    return query.watch().map((rows) {
      final map = <String, CategoryWithCount>{};

      for (final row in rows) {
        final category = row.readTable(categories);
        final product = row.readTableOrNull(products);

        final existing = map.putIfAbsent(
          category.id,
          () => CategoryWithCount(category: category, productCount: 0),
        );

        if (product != null) {
          existing.productCount++;
        }
      }

      return map.values.toList();
    });
  }

  // 🔥 BASIC CRUD

  Future<List<Category>> getCategories() => select(categories).get();

  Future<void> insertCategory(CategoriesCompanion category) =>
      into(categories).insert(category);

  // ⚠️ NORMAL DELETE (dangerous if products exist)
  Future<void> deleteCategory(String id) =>
      (delete(categories)..where((tbl) => tbl.id.equals(id))).go();

  // 🔥 SAFE DELETE (RECOMMENDED FOR POS)
  Future<void> deleteCategorySafe(String id) async {
    final relatedProducts = await (select(
      products,
    )..where((p) => p.categoryId.equals(id))).get();

    if (relatedProducts.isNotEmpty) {
      throw Exception("CATEGORY_NOT_EMPTY");
    }

    await deleteCategory(id);
  }

  // =====================================================
  // COUNTER (BILL SYSTEM)
  // =====================================================

  Future<void> initCounter() async {
    final data = await select(counterTable).get();
    if (data.isEmpty) {
      await into(counterTable).insert(
        const CounterTableCompanion(
          id: Value(1),
          currentBillNumber: Value('BILL_001'),
        ),
      );
    }
  }

  Future<String> getCurrentBill() async {
    final row = await select(counterTable).getSingle();
    return row.currentBillNumber;
  }

  String _nextBill(String current) {
    final num = int.parse(current.split('_')[1]);
    final next = num + 1;
    return 'BILL_${next.toString().padLeft(3, '0')}';
  }

  Future<String> incrementBill() async {
    final row = await select(counterTable).getSingle();
    final next = _nextBill(row.currentBillNumber);

    await (update(counterTable)..where((t) => t.id.equals(1))).write(
      CounterTableCompanion(currentBillNumber: Value(next)),
    );

    return next;
  }

  // =====================================================
  // HISTORY + PURCHASE ITEMS (IMPORTANT PART)
  // =====================================================

  /// CREATE BILL (FULL TRANSACTION)
  Future<void> createBill({
    required HistoryTableCompanion history,
    required List<PurchaseItemTableCompanion> items,
  }) async {
    await transaction(() async {
      await into(historyTable).insert(history);

      for (final item in items) {
        await into(purchaseItemTable).insert(item);
      }
    });
  }

  Future<List<HistoryTableData>> getAllHistory() => select(historyTable).get();

  Future<HistoryTableData?> getHistoryById(String id) {
    return (select(
      historyTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<PurchaseItemTableData>> getHistoryItems(String historyId) {
    return (select(
      purchaseItemTable,
    )..where((t) => t.historyId.equals(historyId))).get();
  }

  /// FULL DETAIL (history + items)
  Future<Map<String, dynamic>> getHistoryDetail(String id) async {
    final history = await getHistoryById(id);
    final items = await getHistoryItems(id);

    return {"history": history, "items": items};
  }

  Future<void> deleteHistory(String id) async {
    await transaction(() async {
      await (delete(
        purchaseItemTable,
      )..where((t) => t.historyId.equals(id))).go();

      await (delete(historyTable)..where((t) => t.id.equals(id))).go();
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/pos.sqlite');

    // if (await file.exists()) {
    //   file.deleteSync();
    // }

    return NativeDatabase(file);
  });
}
