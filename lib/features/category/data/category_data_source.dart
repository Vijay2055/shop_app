// lib/features/category/data/datasources/category_local_data_source.dart

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/database/providers/app_database_provider.dart';

abstract class CategoryLocalDataSource {
  Future<List<Category>> getAllCategories();
  Future<void> insertCategory(CategoriesCompanion companion);
  Future<void> deleteCategory(String id);
  Future<void> updateCategory(String id,CategoriesCompanion companion);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final AppDatabase _db;

  CategoryLocalDataSourceImpl(this._db);

  @override
  Future<List<Category>> getAllCategories() async {
    // Just return the raw Drift rows directly
    return await _db.select(_db.categories).get();
  }

  @override
  Future<void> insertCategory(CategoriesCompanion companion) async {
    // Accept the companion directly from the repository
    await _db
        .into(_db.categories)
        .insert(companion, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> deleteCategory(String id) async {
    await (_db.delete(_db.categories)..where((tbl) => tbl.id.equals(id))).go();
  }

  // lib/features/category/data/datasources/category_local_data_source.dart

@override
Future<void> updateCategory(String id, CategoriesCompanion companion) async {
  await (_db.update(_db.categories)..where((tbl) => tbl.id.equals(id)))
      .write(companion);
}

  // Inside your CategoryLocalDataSource
  // Future<List<CategoryWithCount>> getCategoriesWithCounts() {
  //   final countColumn = products.id.count();

  //   final query = select(categories).join([
  //     leftOuterJoin(products, products.categoryId.equalsExp(categories.id)),
  //   ]);

  //   query.groupBy([categories.id]);

  //   // Drift returns a typed wrapper containing the Category row and the calculated count
  //   return query.map((row) {
  //     return CategoryWithCount(
  //       category: row.readTable(categories),
  //       productCount: row.read(countColumn),
  //     );
  //   }).get();
  // }
}


final categoryLocalDataSourceProvider = Provider<CategoryLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CategoryLocalDataSourceImpl(db);
});