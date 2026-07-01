import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/data/category_data_source.dart';
import 'package:shop_app/features/category/data/repository/category_repsotory_impl.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';

abstract class CategoryRepository {
  Future<Result<List<CategoryEntity>>> getCategories();
  Future<Result<void>> addCategory(CategoryEntity category);
  Future<Result<void>> deleteCategory(String id);
  Future<Result<void>> updateCategory(CategoryEntity category);
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final localDataSource = ref.watch(categoryLocalDataSourceProvider);
  return CategoryRepositoryImpl(localDataSource);
});