import 'package:shop_app/features/category/domain/models/category_with_count.dart';

abstract class CategoryRepository {
  Future<List<CategoryWithCount>> getCategories();

  Stream<List<CategoryWithCount>> watchCategories();

  Future<void> addCategory(String name);

  Future<void> deleteCategory(String id);
}