import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/core/widgets/app_data_table/app_empty_table.dart';
import 'package:shop_app/core/widgets/app_data_table/app_paginated_table.dart';
import 'package:shop_app/features/barcode/presentation/providers/barcode_provider.dart';
import 'package:shop_app/features/barcode/presentation/providers/prouct_variant_list_provider.dart';

class BarcodeProductList extends ConsumerWidget {
  const BarcodeProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(barcodeProvider);

    final notifier = ref.read(barcodeProvider.notifier);

    final barcodeProductState = ref.watch(productVariantListNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Product',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    ref
                        .read(productVariantListNotifierProvider.notifier)
                        .searchVariantProduct(value);
                  },
                ),
              ),

              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("${state.items.length} Selected"),
              ),

              const SizedBox(width: 16),

              FilledButton.icon(
                onPressed: state.items.isEmpty
                    ? null
                    : () {
                        context.push(Pages.barcode);
                      },
                icon: const Icon(Icons.qr_code),
                label: const Text('Generate Barcode'),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: barcodeProductState.products.isEmpty
                ? AppTableEmpty()
                : Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: DataTable2(
                        minWidth: 500,
                        headingRowHeight: 56,
                        dataRowHeight: 64,
                        columnSpacing: 16,
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn2(
                            fixedWidth: 70,
                            label: Checkbox(
                              value:
                                  barcodeProductState.products.isNotEmpty &&
                                  state.items.length ==
                                      barcodeProductState.products.length,
                              onChanged: (_) {
                                if (state.items.length ==
                                    barcodeProductState.products.length) {
                                  notifier.clearSelection();
                                } else {
                                  notifier.selectAll(
                                    barcodeProductState.products,
                                  );
                                }
                              },
                            ),
                          ),

                          const DataColumn2(
                            size: ColumnSize.L,
                            label: Text("Product"),
                          ),

                          const DataColumn2(label: Text("Barcode")),
                          const DataColumn(label: Text("Stock")),

                          const DataColumn2(label: Text("Labels")),
                        ],
                        rows: barcodeProductState.products.map((product) {
                          final selected = state.items.any(
                            (e) => e.product.id == product.id,
                          );

                          return DataRow(
                            selected: selected,
                            cells: [
                              DataCell(
                                Checkbox(
                                  value: selected,
                                  onChanged: (_) {
                                    notifier.toggleProduct(product);
                                  },
                                ),
                              ),

                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product.variant,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              DataCell(SelectableText(product.barcode)),
                              DataCell(Text(product.stock.toString())),

                              DataCell(
                                Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 18,
                                        ),
                                        onPressed: selected
                                            ? () => notifier.decreaseQuantity(
                                                product.id,
                                              )
                                            : null,
                                      ),

                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "${notifier.getQuantity(product.id)}",
                                          ),
                                        ),
                                      ),

                                      IconButton(
                                        icon: const Icon(Icons.add, size: 18),
                                        onPressed: selected
                                            ? () => notifier.increaseQuantity(
                                                product.id,
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
          ),

          if (barcodeProductState.searchQuery.trim().isEmpty)
            AppTablePagination(
              currentPage: barcodeProductState.currentPage,
              totalPages: barcodeProductState.totalPages,
              onPrevious: () {
                ref
                    .read(productVariantListNotifierProvider.notifier)
                    .previousPage();
              },
              onNext: () {
                ref
                    .read(productVariantListNotifierProvider.notifier)
                    .nextPage();
              },
            ),
        ],
      ),
    );
  }
}
