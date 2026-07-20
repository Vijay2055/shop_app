import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';

class ProductState {
  final String? error;
  final int currentPage;
  final int pageSize;
  final int totalProducts;
  final List<ProductEntity> products;
  final String searchQuery;
  final String? selectedCategoryId;

 const  ProductState({
    this.error,
    this.products = const [],
    this.searchQuery = '',
    this.currentPage=1,
    this.pageSize=3,
    this.totalProducts=0,
    this.selectedCategoryId,
  });

  ProductState copyWith({
    String? error,
    List<ProductEntity>? products,
    String? searchQuery,
    String? selectedCategoryId,
  }) {
    return ProductState(
      error: error ?? this.error,
      products: products ?? this.products,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }
  
  int get totalPages=>(totalProducts/pageSize).ceil();

}
