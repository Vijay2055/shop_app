import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/core/widgets/app_data_table/app_paginated_table.dart';
import 'package:shop_app/core/widgets/app_data_table/app_table_header.dart';
import 'package:shop_app/features/product/presentation/providers/product_provider.dart';
import 'package:shop_app/features/product/presentation/widgets/product_data_table.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AppTableHeader(
            title: 'Products',
            subtitle: 'Manage your products',
            searchHint: 'Search product...',
            onSearchChanged: (value) {
              ref.read(productNotifierProvider.notifier).searchProducts(value);
            },
            addButtonText: 'Add Product',
            onAddPressed: () {
              context.push(Pages.addEditProduct, extra: null);
            },
          ),

          Expanded(
            child: ProductTable(
              products: state.value?.products ?? [],
              isLoading: state.isLoading,
              error: state.value?.error,
              onProductTap: (product) {
                context.push(Pages.addEditProduct, extra: product);
              },
            ),
          ),

          const SizedBox(height: 16),
          if (state.value != null && state.value!.searchQuery.isEmpty)
            AppTablePagination(
              currentPage: state.value?.currentPage ?? 1,
              totalPages: state.value?.totalPages ?? 1,
              onPrevious: () {
                ref.read(productNotifierProvider.notifier).previousPage();
              },
              onNext: () {
                ref.read(productNotifierProvider.notifier).nextPage();
              },
            ),
        ],
      ),
    );
  }
}
