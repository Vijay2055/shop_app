import 'package:shop_app/features/category/domain/models/category_with_count.dart';
import 'package:shop_app/core/database/app_database.dart';

class CategoryLocalDataSource {
  final AppDatabase db;

  CategoryLocalDataSource(this.db);

  // -------- GET ALL WITH COUNT --------
  Future<List<CategoryWithCount>> getCategoriesWithCount() async {
    try {
      return await db.getCategoriesWithCount();
    } catch (e) {
      throw Exception("Database error: $e");
    }
  }

  // -------- STREAM (BEST FOR UI) --------
  Stream<List<CategoryWithCount>> watchCategoriesWithCount() {
    try {
      return db.watchCategoriesWithCount();
    } catch (e) {
      throw Exception("Stream error: $e");
    }
  }

  // -------- ADD CATEGORY --------
  Future<void> addCategory(String name) async {
    try {
      await db
          .into(db.categories)
          .insert(CategoriesCompanion.insert(id: _generateId(), name: name));
    } catch (e) {
      throw Exception("Insert category failed: $e");
    }
  }

  // -------- DELETE CATEGORY --------
  Future<void> deleteCategory(String id) async {
    try {
      await db.deleteCategory(id);
    } catch (e) {
      throw Exception("Delete category failed: $e");
    }
  }

  // -------- SAFE DELETE (OPTIONAL - PRO LEVEL) --------
  Future<void> deleteCategorySafe(String id) async {
    try {
      final products = await (db.select(
        db.products,
      )..where((p) => p.categoryId.equals(id))).get();

      if (products.isNotEmpty) {
        throw Exception("CATEGORY_NOT_EMPTY");
      }

      await db.deleteCategory(id);
    } catch (e) {
      throw Exception("Delete failed: $e");
    }
  }

  // -------- HELPER --------
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
