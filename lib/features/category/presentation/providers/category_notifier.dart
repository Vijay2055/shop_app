import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/domain/models/category_with_count.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';
import 'package:shop_app/features/category/presentation/providers/categoryRepositoryProvider.dart';

class CategoryNotifier extends AsyncNotifier<List<CategoryWithCount>> {
  CategoryRepository get repository => ref.read(categoryRepoProvider);

  @override
  Future<List<CategoryWithCount>> build() async {
    return await repository.getCategories();
  }

  // 🔥 RELOAD
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await repository.getCategories();
    });
  }

  // 🔥 ADD CATEGORY
  Future<void> addCategory(String name) async {
    await repository.addCategory(name);
    await refresh();
  }

  // 🔥 DELETE CATEGORY
  Future<void> deleteCategory(String id) async {
    await repository.deleteCategory(id);
    await refresh();
  }
}
