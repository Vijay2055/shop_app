import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/app_data_table/app_data_table.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({
    super.key,
    required this.products,
    this.isLoading = false,
    this.error,
    required this.onProductTap,
  });
  final List<ProductEntity> products;
  final bool isLoading;
  final String? error;
  final ValueChanged<ProductEntity> onProductTap;

  @override
  Widget build(BuildContext context) {
    return AppDataTable(
      loading: isLoading,
      error: error,
      columns: const [
        DataColumn2(label: Text('Name'), size: ColumnSize.L),
        DataColumn2(label: Text('Category'), size: ColumnSize.L),
        DataColumn2(label: Text('Description'), size: ColumnSize.L),
        DataColumn2(label: Text('Status'), fixedWidth: 110),
      ],
      rows: products.map((product) {
        return DataRow2(
          onTap: () {
            onProductTap(product);
          },
          cells: [
            DataCell(Text(product.name)),
            DataCell(Text(product.category.name)),
            DataCell(Text(product.description ?? '-')),
            DataCell(
              Text(
                product.isActive ? 'Active' : 'Inactive',
                style: TextStyle(
                  color: product.isActive ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
