// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shop_app/app/pages.dart';
// import 'package:shop_app/features/barcode/presentation/providers/barcode_provider.dart';
// import 'package:shop_app/features/product/presentation/providers/product_provider.dart';

// class BarcodeProductList extends ConsumerWidget {
//   const BarcodeProductList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(barcodeProvider);

//     final notifier = ref.read(barcodeProvider.notifier);

//     final products = ref.watch(productNotifierProvider).asData?.value ?? [];

//     final filteredProducts = products.where((product) {
//       return product.name.toLowerCase().contains(
//         state.searchQuery.toLowerCase(),
//       );
//     }).toList();

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: 350,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search Product',
//                     prefixIcon: const Icon(Icons.search),
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onChanged: notifier.updateSearch,
//                 ),
//               ),

//               const Spacer(),

//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.primaryContainer,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text("${state.items.length} Selected"),
//               ),

//               const SizedBox(width: 16),

//               FilledButton.icon(
//                 onPressed: state.items.isEmpty
//                     ? null
//                     : () {
//                         context.push(Pages.barcode);
//                       },
//                 icon: const Icon(Icons.qr_code),
//                 label: const Text('Generate Barcode'),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),

//           Expanded(
//             child: Card(
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: DataTable2(
//                   minWidth: 500,
//                   headingRowHeight: 56,
//                   dataRowHeight: 64,
//                   columnSpacing: 16,
//                   showCheckboxColumn: false,
//                   columns: [
//                     DataColumn2(
//                       fixedWidth: 70,
//                       label: Checkbox(
//                         value:
//                             filteredProducts.isNotEmpty &&
//                             state.items.length == filteredProducts.length,
//                         onChanged: (_) {
//                           if (state.items.length == filteredProducts.length) {
//                             notifier.clearSelection();
//                           } else {
//                             notifier.selectAll(filteredProducts);
//                           }
//                         },
//                       ),
//                     ),

//                     const DataColumn2(
//                       size: ColumnSize.L,
//                       label: Text("Product"),
//                     ),

//                     const DataColumn2(label: Text("Barcode")),

//                     const DataColumn2(label: Text("Labels")),
//                   ],
//                   rows: filteredProducts.map((product) {
//                     final selected = state.items.any(
//                       (e) => e.product.id == product.id,
//                     );

//                     return DataRow(
//                       selected: selected,
//                       cells: [
//                         DataCell(
//                           Checkbox(
//                             value: selected,
//                             onChanged: (_) {
//                               notifier.toggleProduct(product);
//                             },
//                           ),
//                         ),

//                         DataCell(
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 18,
//                                 child: Text(
//                                   product.name.isNotEmpty
//                                       ? product.name[0]
//                                       : "P",
//                                 ),
//                               ),

//                               const SizedBox(width: 12),

//                               Expanded(
//                                 child: Text(
//                                   product.name,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         DataCell(SelectableText(product.barcode)),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey.shade300),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.remove, size: 18),
//                                   onPressed: selected
//                                       ? () => notifier.decreaseQuantity(
//                                           product.id,
//                                         )
//                                       : null,
//                                 ),

//                                 Expanded(
//                                   child: Center(
//                                     child: Text(
//                                       "${notifier.getQuantity(product.id)}",
//                                     ),
//                                   ),
//                                 ),

//                                 IconButton(
//                                   icon: const Icon(Icons.add, size: 18),
//                                   onPressed: selected
//                                       ? () => notifier.increaseQuantity(
//                                           product.id,
//                                         )
//                                       : null,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
