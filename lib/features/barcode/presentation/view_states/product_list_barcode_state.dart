import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';

class ProductListBarcodeState {
  final String? error;
  final int currentPage;
  final int pageSize;
  final bool isLoading;

  final int totalProductVariants;
  final List<ProductVariantEntity> products;
  final String searchQuery;

  const ProductListBarcodeState({
    this.error,
    this.products = const [],
    this.searchQuery = '',
    this.currentPage = 1,
    this.pageSize = 3,
    this.isLoading = false,
    this.totalProductVariants = 0,
  });

  ProductListBarcodeState copyWith({
    String? error,
    int? currentPage,
    int? pageSize,
    bool? isLoading,
    int? totalProductVariants,
    List<ProductVariantEntity>? products,
    final String? searchQuery,
  }) {
    return ProductListBarcodeState(
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
      pageSize: pageSize ?? this.pageSize,
      products: products ?? this.products,
      searchQuery: searchQuery ?? this.searchQuery,
      totalProductVariants: totalProductVariants ?? this.totalProductVariants,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  int get totalPages => (totalProductVariants / pageSize).ceil();
}
