import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/presentation/state/product_state.dart';
import 'package:shop_app/features/product/providers/usecase_providers.dart';

class ProductNotifier extends AsyncNotifier<ProductState> {
  @override
  Future<ProductState> build() async {
    return await _loadProduct(page: 1);
  }

  Future<ProductState> _loadProduct({required int page}) async {
    final productResult = await ref.read(getProductsUseCaseProvider)(
      page: page,
      limit: 3,
    );
    final countResult = await ref.read(getProductCountsUsecaseProvider)();

    switch ((productResult, countResult)) {
      case (
        Success<List<ProductEntity>>(data: final data),
        Success<int>(data: final total),
      ):
        return ProductState(
          products: data,
          currentPage: page,
          pageSize: 3,
          totalProducts: total,
        );

      case (FailureResult(:final failure), _):
        return ProductState(error: failure.message);

      case (_, FailureResult(:final failure)):
        return ProductState(error: failure.message);
    }
  }

  Future<void> nextPage() async {
    final current = state.requireValue;

    if (current.currentPage >= current.totalPages) return;

    state = const AsyncLoading();

    state = AsyncData(await _loadProduct(page: current.currentPage + 1));
  }

  Future<void> previousPage() async {
    final current = state.requireValue;

    if (current.currentPage <= 1) return;

    state = const AsyncLoading();

    state = AsyncData(await _loadProduct(page: current.currentPage - 1));
  }

  Future<void> searchProducts(String query) async {
    query = query.trim();

    if (query.isEmpty) {
      state = const AsyncLoading();
      state = AsyncData(await _loadProduct(page: 1));
      return;
    }
    state = const AsyncValue.loading();
    final result = await ref.read(searchProductsUseCaseProvider)(query);
    switch (result) {
      case Success<List<ProductEntity>>(:final data):
        state = AsyncValue.data(
          ProductState(
            products: data,
            searchQuery: query,
            totalProducts: data.length,
            currentPage: 1,
            pageSize: state.value?.pageSize ?? 3,
          ),
        );
      case FailureResult(:final failure):
        state = AsyncValue.data(
          ProductState(error: failure.message, searchQuery: query),
        );
    }
  }
}

final productNotifierProvider =
    AsyncNotifierProvider.autoDispose<ProductNotifier, ProductState>(
      ProductNotifier.new,
    );
