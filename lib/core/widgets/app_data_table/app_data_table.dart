import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/app_data_table/app_empty_table.dart';
import 'package:shop_app/core/widgets/app_data_table/app_loading_table.dart';

class AppDataTable extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.loading = false,
    this.emptyMessage,
    this.minWidth,
    this.error,
  });

  final List<DataColumn2> columns;
  final List<DataRow> rows;

  final bool loading;

  final String? emptyMessage;
  final String? error;

  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const AppTableLoading();
    }

    if (error != null) {
      return AppTableEmpty(message: error!, icon: Icons.error_outline);
    }

    if (rows.isEmpty) {
      return AppTableEmpty(message: emptyMessage ?? 'No data found');
    }

    return DataTable2(
      minWidth: minWidth,

      showCheckboxColumn: false,

      columnSpacing: 18,

      horizontalMargin: 18,

      headingRowHeight: 55,

      dataRowHeight: 56,

      bottomMargin: 20,

      dividerThickness: .3,

      columns: columns,

      rows: rows,
    );
  }
}
