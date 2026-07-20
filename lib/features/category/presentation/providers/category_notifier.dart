import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/core/utils/result_provider.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';

import 'package:shop_app/features/category/presentation/view_holder/category_state.dart';
import 'package:shop_app/features/category/providers/category_usecase_providers.dart';

class CategoryNotifier extends AsyncNotifier<CategoryState> {
  @override
  Future<CategoryState> build() async {
    return _loadCategories();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  Future<CategoryState> _loadCategories() async {
    state = const AsyncValue.loading();

    final result = ref.read(getCategoriesUsecaseProvider);
    final ans = await result.call();
    switch (ans) {
      case Success<List<CategoryEntity>> success:
        final categories = success.data;
        return CategoryState(categories: categories);

      case FailureResult<List<CategoryEntity>> failure:
        throw failure.failure;
    }
  }

  Future<Result> addCategory(CategoryEntity category) async {
    final addCategory = ref.read(addCategoryUsecaseProvider);

    final result = await addCategory(category);

    switch (result) {
      case Success():
        ref.invalidateSelf();

        ref
            .read(resultProvider.notifier)
            .showSuccess("Category added successfully");

      case FailureResult(failure: final failure):
        ref.read(resultProvider.notifier).showError(failure.message);
    }

    return result;
  }
}
