import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/presentation/view_states/product_list_barcode_state.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/providers/usecase_providers.dart';

class ProductVariantListNotifier extends Notifier<ProductListBarcodeState> {
  @override
  build() {
    Future.microtask(() {
      _loadProduct();
    });
    return ProductListBarcodeState();
  }

  Future<void> _loadProduct({int page = 1}) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await ref.read(getProductVariantListUsecaseProvider)(
      page: page,
      limit: 3,
    );
    final countResult = await ref.read(getProductVariantCountUsecaseProvider)();

    switch ([result, countResult]) {
      case [
        Success<List<ProductVariantEntity>>(:final data),
        Success<int>(data: final count),
      ]:
        state = state.copyWith(
          products: data,
          totalProductVariants: count,
          error: null,
          currentPage: page,
          pageSize: 3,
          searchQuery: "",
          isLoading: false,
        );
        break;

      case [
        FailureResult<List<ProductVariantEntity>>(:final failure),
        FailureResult<int>(failure: final countError),
      ]:
        state = state.copyWith(
          error: failure.message,
          isLoading: false,
          searchQuery: "",
        );
        print(countError);

        break;
    }
  }

  Future<void> searchVariantProduct(String query) async {
    state = state.copyWith(isLoading: true, error: null);
    if (query.trim().isEmpty) {
      await _loadProduct(page: 1);
      return;
    }
    final result = await ref.read(
      getSearchedProductVariantCountUsecaseProvider,
    )(query);

    switch (result) {
      case Success<List<ProductVariantEntity>>(:final data):
        state = state.copyWith(
          products: data,
          isLoading: false,
          error: null,
          searchQuery: query,
        );
        break;
      case FailureResult<List<ProductVariantEntity>>(:final failure):
        state = state.copyWith(
          products: null,
          isLoading: false,
          error: failure.message,
          searchQuery: query,
        );
        break;
    }
  }

  Future<void> nextPage() async {
    final current = state;

    if (current.currentPage >= current.totalPages) return;

    _loadProduct(page: current.currentPage + 1);
  }

  Future<void> previousPage() async {
    final current = state;

    if (current.currentPage <= 1) return;

    _loadProduct(page: current.currentPage - 1);
  }
}

final productVariantListNotifierProvider =
    NotifierProvider<ProductVariantListNotifier, ProductListBarcodeState>(
      ProductVariantListNotifier.new,
    );
