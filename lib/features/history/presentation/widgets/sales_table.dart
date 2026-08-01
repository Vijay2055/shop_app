import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shop_app/core/widgets/app_data_table/app_data_table.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';

class SalesHistoryTable extends StatelessWidget {
  const SalesHistoryTable({
    super.key,
    required this.sales,
    required this.onTap,
    required this.action,
    this.loading = false,
    this.error,
  });

  final List<SaleHistoryEntity> sales;
  final bool loading;
  final String? error;

  final ValueChanged<SaleHistoryEntity> onTap;
  final Widget Function(SaleHistoryEntity sale) action;

  @override
  Widget build(BuildContext context) {
    return AppDataTable(
      loading: loading,
      error: error,
      columns: const [
        DataColumn2(label: Text("Invoice"), fixedWidth: 120),
        DataColumn2(label: Text("Date"), fixedWidth: 170),
        DataColumn2(label: Text("Customer"), fixedWidth: 180),
        DataColumn2(label: Text("Items"), fixedWidth: 70, numeric: true),

        DataColumn2(label: Text("Total"), fixedWidth: 120, numeric: true),
        DataColumn2(label: Text("Payment"), fixedWidth: 120),
        DataColumn2(label: Text("Action"), fixedWidth: 120),
      ],
      rows: sales.map((sale) {
        final paymentColor = switch (sale.paymentStatus) {
          PaymentStatus.paid => Colors.green,
          PaymentStatus.partial => Colors.orange,
          PaymentStatus.unpaid => Colors.red,
        };

        return DataRow2(
          onTap: () => onTap(sale),
          cells: [
            DataCell(
              Text(
                sale.invoiceNumber,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            DataCell(
              Text(DateFormat('dd MMM yyyy hh:mm a').format(sale.createdAt)),
            ),

            DataCell(Text(sale.customerName, overflow: TextOverflow.ellipsis)),

            DataCell(Text(sale.totalItems.toString())),

            DataCell(
              Text(
                "₹${sale.grandTotal.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            DataCell(
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: paymentColor.withOpacity(.12),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    sale.paymentStatus.name.toUpperCase(),
                    style: TextStyle(
                      color: paymentColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),

            DataCell(Center(child: action(sale))),
          ],
        );
      }).toList(),
    );
  }
}
