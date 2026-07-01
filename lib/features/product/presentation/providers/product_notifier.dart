// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:shop_app/features/product/domain/entities/product.dart';
// import 'package:shop_app/features/product/domain/repositories/product_repository.dart';
// import 'package:shop_app/features/product/presentation/providers/ripository_provider.dart';

// class ProductNotifier extends AsyncNotifier<List<Product>> {
//   late final ProductRepository repository;

//   @override
//   Future<List<Product>> build() async {
//     repository = ref.read(repositoryProvider);
//     return _fetchProducts();
//   }

//   /// 📦 FETCH PRODUCTS
//   Future<List<Product>> _fetchProducts() async {
//     final result = await repository.getProducts();

//     if (!result.isSuccess) {
//       throw Exception(result.error?.message ?? "Unhandled error");
//     }

//     return result.data ?? [];
//   }

//   /// 🔄 REFRESH
//   Future<void> loadProducts() async {
//     state = await AsyncValue.guard(() async {
//       return _fetchProducts();
//     });
//   }

//   /// ➕ ADD PRODUCT
//   Future<String?> addProduct(Product product) async {
//     final result = await repository.addProduct(product);
//     if (!result.isSuccess) {
//       return result.error?.message;
//     }
//     await loadProducts();
//     return null;
//   }

//   /// ✏️ UPDATE PRODUCT
//   Future<bool> updateProduct(Product product) async {
//     final result = await repository.updateProduct(product);
//     if (!result.isSuccess) {
//       return false;
//     }
//     await loadProducts();
//     return true;
//   }

//   /// 🗑️ DELETE PRODUCT
//   Future<bool> deleteProduct(String id) async {
//     final result = await repository.deleteProduct(id);
//     if (!result.isSuccess) {
//       return false;
//     }
//     await loadProducts();
//     return true;
//   }

//   /// 🔍 FIND BY BARCODE
//   Future<Product?> findProductByBarcode(String barcode) async {
//     final currentData = state.value;

//     // ⚡ 1. MEMORY SEARCH
//     if (currentData != null) {
//       try {
//         return currentData.firstWhere((p) => p.barcode == barcode);
//       } catch (_) {}
//     }

//     final result = await repository.findByBarcode(barcode);
//     if (!result.isSuccess) {
//       throw Exception(result.error?.message ?? "Unhandled error");
//     }
//     // 🗄️ 2. DATABASE SEARCH
//     return result.data;
//   }

//   Future<void> searchProducts(String query) async {
//     state = const AsyncLoading();

//     state = await AsyncValue.guard(() async {
//       final result = await repository.searchProducts(query);

//       if (!result.isSuccess) {
//         throw Exception(result.error?.message);
//       }

//       return result.data ?? [];
//     });
//   }
// }
