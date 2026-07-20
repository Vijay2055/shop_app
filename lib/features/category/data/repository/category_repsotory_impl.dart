// lib/features/category/data/repository/category_repository_impl.dart

import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/data/category_data_source.dart';
import 'package:shop_app/features/category/data/models/category_model.dart'; // Holds your extensions (.toEntity(), .toCompanion())
import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource _localDataSource;

  CategoryRepositoryImpl(this._localDataSource);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    try {
      // 1. Get raw Drift objects from data source
      final driftCategories = await _localDataSource.getAllCategories();

      // 2. DO THE MAPPING HERE at the repository level
      final entities = driftCategories
          .map((dbRow) => dbRow.toEntity())
          .toList();

      return Success(entities);
    } catch (e) {
      print(e);
      return FailureResult(DatabaseFailure('Failed to load categories: $e'));
    }
  }

  @override
  Future<Result<void>> addCategory(CategoryEntity category) async {
    try {
      // 1. DO THE MAPPING HERE: Turn domain entity into database companion
      final companion = category.toCompanion();

      // 2. Pass database-ready type to data source
      await _localDataSource.insertCategory(companion);
      return Success(null);
    } catch (e) {
      print(e);
      return FailureResult(DatabaseFailure('Failed to add category: $e'));
    }
  }

  @override
  Future<Result<void>> deleteCategory(int id) async {
    try {
      // No mapping needed for a primitive String ID
      await _localDataSource.deleteCategory(id);
      return Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure('Failed to delete category: $e'));
    }
  }

  @override
  Future<Result> updateCategory(CategoryEntity category) async {
    try {
      if (category.id == null) {
        return FailureResult(
          DatabaseFailure('Category ID is required for update'),
        );
      }

      final companion = category.toCompanion();

      await _localDataSource.updateCategory(category.id!, companion);

      return Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure('Failed to update category: $e'));
    }
  }

  @override
  Future<Result<CategoryEntity>> getCategoryById(int categoryId) async {
    try {
      final result = await _localDataSource.getCategoryById(categoryId);
      final category = result.toEntity();
      return Success(category);
    } catch (e) {
      return FailureResult(DatabaseFailure('Failed to  category: $e'));
    }
  }
}
