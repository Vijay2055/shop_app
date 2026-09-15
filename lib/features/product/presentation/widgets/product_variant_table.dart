import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/features/product/domain/entities/product_varient_draft.dart';

class ProductVariantTable extends StatelessWidget {
  const ProductVariantTable({
    super.key,
    required this.variants,
    required this.onDelete,
    required this.onAddVariant,
    required this.onItemTap,
  });

  final List<ProductVariantDraft> variants;
  final void Function(int index) onDelete;
  final VoidCallback onAddVariant;
  final ValueChanged<ProductVariantDraft> onItemTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 120,
        maxHeight: variants.isEmpty ? 200 : 450,
      ),

      child: Card(
        elevation: .5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Variants",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Center(
                    child: OutlinedButton.icon(
                      onPressed: onAddVariant,
                      icon: const Icon(Icons.add),
                      label: const Text("Add Variant"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Expanded(
                child: variants.isEmpty
                    ? Center(child: Text('No variants found'))
                    : DataTable2(
                        showCheckboxColumn: false,
                        headingRowHeight: 52,
                        dataRowHeight: 54,
                        columnSpacing: 16,
                        horizontalMargin: 16,

                        columns: const [
                          DataColumn2(
                            label: Text(
                              "Variant",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          DataColumn2(
                            label: Text(
                              "Barcode",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          DataColumn2(
                            label: Text(
                              "Cost Price",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          DataColumn2(
                            label: Text(
                              "Selling Price",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          DataColumn2(
                            label: Text(
                              "MRP",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          DataColumn2(
                            label: Text(
                              "Stock",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          DataColumn2(
                            fixedWidth: 70,
                            label: Text(
                              "Action",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],

                        rows: List.generate(variants.length, (index) {
                          final item = variants[index];

                          return DataRow2(
                            onTap: () {
                              onItemTap(item);
                            },
                            cells: [
                              DataCell(Text(item.variant.toString())),

                              DataCell(Text(item.barcode.toString())),

                              DataCell(Text(item.costPrice.toString())),

                              DataCell(Text(item.sellingPrice.toString())),
                              DataCell(Text(item.mrp.toString())),

                              DataCell(Text(item.stock.toString())),

                              DataCell(
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      barrierDismissible: true,

                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: Text("Confirm"),
                                          content: Text(
                                            "Are you sure? You want to delete this product",
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                onDelete(index);
                                                ctx.pop();
                                              },
                                              child: Text("Yes"),
                                            ),

                                            OutlinedButton(
                                              onPressed: () {
                                                ctx.pop();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
