// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_app/features/product/domain/entities/product.dart';
// import 'package:shop_app/features/product/presentation/providers/product_provider.dart';
// import 'package:shop_app/features/product/presentation/providers/search_provider.dart';

// class SelectCategoryNotifier extends Notifier<String?> {
//   @override
//   String? build() => null;

//   void update(String? categoryId) {
//     state = categoryId;
//   }

//   void clear() {
//     state = null;
//   }
// }

// final selectedCategoryProvider =
//     NotifierProvider<SelectCategoryNotifier, String?>(SelectCategoryNotifier.new);

// final filteredProductsProvider = Provider<List<Product>>((ref) {
//   final productState = ref.watch(productNotifierProvider);
//   final categoryId = ref.watch(selectedCategoryProvider);
//   final search = ref.watch(searchProvider).toLowerCase();

//   return productState.when(
//     data: (products) {
//       return products.where((p) {
//         final matchCategory =
//             categoryId == null || p.categoryId == categoryId;

//         final matchSearch = p.name.toLowerCase().contains(search);

//         return matchCategory && matchSearch;
//       }).toList();
//     },
//     loading: () => [],
//     error: (_, __) => [],
//   );
// });