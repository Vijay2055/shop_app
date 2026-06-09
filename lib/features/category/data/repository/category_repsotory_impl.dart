import 'package:shop_app/features/category/data/category_data_source.dart';
import 'package:shop_app/features/category/domain/models/category_with_count.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource local;

  CategoryRepositoryImpl(this.local);

  @override
  Future<List<CategoryWithCount>> getCategories() async {
    try {
      return await local.getCategoriesWithCount();
    } catch (e) {
      print(e);
      throw Exception("Repository error: $e");
    }
  }

  @override
  Stream<List<CategoryWithCount>> watchCategories() {
    try {
      return local.watchCategoriesWithCount();
    } catch (e) {
      throw Exception("Repository stream error: $e");
    }
  }

  @override
  Future<void> addCategory(String name) async {
    try {
      if (name.trim().isEmpty) {
        throw Exception("EMPTY_CATEGORY_NAME");
      }

      await local.addCategory(name);
    } catch (e) {
      throw Exception("Add category failed: $e");
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      await local.deleteCategorySafe(id);
    } catch (e) {
      if (e.toString().contains("CATEGORY_NOT_EMPTY")) {
        throw Exception("Cannot delete category with products");
      }

      throw Exception("Delete category failed: $e");
    }
  }
}
