import 'package:shop_app/features/product/domain/entities/product.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String? error;

  ProductState({this.products = const [], this.isLoading = false, this.error});

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
