import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_varient_draft.dart';
import 'package:shop_app/features/product/presentation/providers/product_provider.dart';
import 'package:shop_app/features/product/presentation/state/add_product_state.dart';
import 'package:shop_app/features/product/providers/usecase_providers.dart';

class AddProductNotifier extends AsyncNotifier<AddProductState> {
  @override
  FutureOr<AddProductState> build() {
    return const AddProductState();
  }

  void selectCategory(int categoryId) {
    state = AsyncData(
      state.requireValue.copyWith(selectedCategory: categoryId),
    );
  }

  void addVariant(ProductVariantDraft variant) {
    final variants = [...state.requireValue.variants, variant];

    state = AsyncData(state.requireValue.copyWith(variants: variants));
  }

  void updateVariant(ProductVariantDraft variant) {
    final variants = [...state.requireValue.variants];

    final index = variants.indexWhere((e) => e.id == variant.id);

    if (index != -1) {
      variants[index] = variant;
    }

    state = AsyncData(state.requireValue.copyWith(variants: variants));
  }

  void clearForm() {
    state = const AsyncData(AddProductState());
  }

  Future<Result<void>> loadProduct(String productId) async {
    state = const AsyncLoading();

    final result = await ref
        .read(getProductEditForUsecaseProvider)
        .call(productId);

    switch (result) {
      case Success(:final data):
        state = AsyncData(
          AddProductState(
            selectedCategory: data.category.id,
            variants: data.variants
                .map((value) => ProductVariantDraft.fromEntity(value))
                .toList(),
          ),
        );

      case FailureResult(:final failure):
        state = AsyncData(AddProductState(error: failure.message));
    }

    return result;
  }

  void removeVariant(ProductVariantDraft variant) {
    final variants = [...state.requireValue.variants];

    variants.remove(variant);

    state = AsyncData(state.requireValue.copyWith(variants: variants));
  }

  void clearVariants() {
    state = AsyncData(state.requireValue.copyWith(variants: []));
  }

  Future<Result<void>> addProduct({
    required String name,
    required String description,
  }) async {
    final current = state.requireValue;

    if (current.selectedCategory == null) {
      return FailureResult(DatabaseFailure('Please select a category'));
    }

    if (current.variants.isEmpty) {
      return FailureResult(DatabaseFailure('Please add at least one variant'));
    }

    state = const AsyncLoading();

    final result = await ref
        .read(addProductWithVariantUsecaseProvider)
        .call(
          name: name,
          description: description,
          categoryId: current.selectedCategory ?? 0,
          variants: current.variants,
        );

    switch (result) {
      case Success():
        ref.invalidate(productNotifierProvider);
        state = const AsyncData(AddProductState());

      case FailureResult(:final failure):
        state = AsyncData(current.copyWith(error: failure.message));
    }

    return result;
  }

  // update product with variant

  Future<Result<void>> updateProduct({
    required String productId,
    required String name,
    required String description,
  }) async {
    final current = state.requireValue;

    if (current.selectedCategory == null) {
      return FailureResult(DatabaseFailure('Please select a category'));
    }

    if (current.variants.isEmpty) {
      return FailureResult(DatabaseFailure('Please add at least one variant'));
    }

    state = const AsyncLoading();

    final result = await ref
        .read(updateProductWithVariantUsecaseProvider)
        .call(
          productId: productId,
          name: name,
          description: description,
          categoryId: current.selectedCategory!,
          variants: current.variants,
        );

    switch (result) {
      case Success():
        ref.invalidate(productNotifierProvider);
        state = AsyncData(current);

      case FailureResult(:final failure):
        state = AsyncData(current.copyWith(error: failure.message));
    }

    return result;
  }
}
