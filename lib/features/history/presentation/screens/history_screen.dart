import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/core/widgets/app_data_table/app_paginated_table.dart';
import 'package:shop_app/core/widgets/app_data_table/app_table_header.dart';
import 'package:shop_app/features/history/presentation/enum/menu_enum.dart';
import 'package:shop_app/features/history/presentation/provider/sales_history_notifier.dart';
import 'package:shop_app/features/history/presentation/widgets/sale_menu_action.dart';
import 'package:shop_app/features/history/presentation/widgets/sales_table.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  static const int _pageSize = 200;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(saleHistoryProvider);

    final totalPages = (state.totalCount / _pageSize).ceil().clamp(1, 999999);

    ref.listen(saleHistoryProvider, (prev, next) {
      if (next.message.isNotEmpty) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.message)));
      }
    });

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AppTableHeader(
            title: 'Sales History',
            subtitle: 'View and manage all sales',
            searchHint: 'Search invoice or customer...',
            onSearchChanged: (value) {
              ref.read(saleHistoryProvider.notifier).search(value);
            },
            trailingActions: [
              SizedBox(
                width: 180,
                child: DropdownButtonFormField<PaymentFilter>(
                  value: state.paymentFilter,
                  decoration: const InputDecoration(
                    labelText: "Payment",
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: PaymentFilter.all,
                      child: Text("All"),
                    ),
                    DropdownMenuItem(
                      value: PaymentFilter.paid,
                      child: Text("Paid"),
                    ),
                    DropdownMenuItem(
                      value: PaymentFilter.unpaid,
                      child: Text("Unpaid"),
                    ),
                    DropdownMenuItem(
                      value: PaymentFilter.partial,
                      child: Text("Partial"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(saleHistoryProvider.notifier)
                          .filterByPayment(value);
                    }
                  },
                ),
              ),
            ],
          ),

          //
          Expanded(
            child: SalesHistoryTable(
              sales: state.sales,
              loading: state.isLoading,
              error: state.error,
              onTap: (sale) {
                context.push(Pages.historyDetail, extra: sale.id);
              },
              action: (sale) {
                return SaleHistoryActionMenu(
                  isCredit: sale.saleType == SaleType.credit,
                  hasDue: sale.totalItems > 0,
                  onSelected: (action) {
                    switch (action) {
                      case SaleHistoryAction.view:
                        // Open details screen
                        context.push(Pages.historyDetail, extra: sale.id);
                        break;

                      case SaleHistoryAction.delete:
                        ref
                            .read(saleHistoryProvider.notifier)
                            .deleteSale(sale.id);
                        break;
                    }
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          AppTablePagination(
            currentPage: state.page,
            totalPages: totalPages,
            onPrevious: state.page > 1
                ? () {
                    ref
                        .read(saleHistoryProvider.notifier)
                        .loadPage(state.page - 1);
                  }
                : null,
            onNext: state.page < totalPages
                ? () {
                    ref
                        .read(saleHistoryProvider.notifier)
                        .loadPage(state.page + 1);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
