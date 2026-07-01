// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shop_app/app/pages.dart';
// import 'package:shop_app/core/utils/popup/add_product_dialogue.dart';
// import 'package:shop_app/features/product/domain/entities/product.dart';
// import 'package:shop_app/features/product/presentation/providers/product_provider.dart';
// import 'package:shop_app/features/product/presentation/providers/search_provider.dart';
// import 'package:shop_app/features/product/presentation/providers/selectedCategoryProvider.dart';
// import 'package:shop_app/features/product/presentation/screens/barcode_screen.dart';

// class ProductScreen extends ConsumerWidget {
//   const ProductScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final products = ref.watch(filteredProductsProvider);

//     return Container(
//       color: Colors.grey[100],
//       padding: const EdgeInsets.all(24),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Products",
//                     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                   ),

//                   /// ➕ Add Product
//                   ElevatedButton.icon(
//                     onPressed: () => showAddDialog(context, ref),
//                     icon: const Icon(Icons.add),
//                     label: const Text("Add Product"),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               /// SEARCH
//               TextField(
//                 onChanged: (v) {
//                   ref.read(searchProvider.notifier).update(v);
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search product...",
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// GRID
//               products.isEmpty
//                   ? const Center(child: Text('No product found'))
//                   : Expanded(
//                       child: GridView.builder(
//                         itemCount: products.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.4,
//                               crossAxisSpacing: 12,
//                               mainAxisSpacing: 12,
//                             ),
//                         itemBuilder: (context, index) {
//                           final p = products[index];

//                           final isLowStock = p.stock < 5;

//                           return MouseRegion(
//                             cursor: SystemMouseCursors.click,
//                             child: Container(
//                               padding: const EdgeInsets.all(14),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(16),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     blurRadius: 8,
//                                     color: Colors.black12,
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   /// NAME + MENU
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           p.name,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),

//                                       PopupMenuButton(
//                                         itemBuilder: (context) => [
//                                           PopupMenuItem(
//                                             child: const Text("Edit"),
//                                             onTap: () => Future.delayed(
//                                               Duration.zero,
//                                               () {
//                                                 _showEditDialog(
//                                                   context,
//                                                   p,
//                                                   ref,
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                           PopupMenuItem(
//                                             child: const Text("Delete"),
//                                             onTap: () => Future.delayed(
//                                               Duration.zero,
//                                               () {
//                                                 _showDeleteDialogue(
//                                                   context,
//                                                   p,
//                                                   ref,
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),

//                                   const SizedBox(height: 8),

//                                   Text("Price: Rs ${p.price}"),
//                                   Text("Stock: ${p.stock}"),

//                                   const Spacer(),

//                                   /// LOW STOCK WARNING
//                                   Row(
//                                     mainAxisAlignment: isLowStock
//                                         ? MainAxisAlignment.spaceBetween
//                                         : MainAxisAlignment.end,
//                                     children: [
//                                       if (isLowStock)
//                                         Container(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 10,
//                                             vertical: 4,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             color: Colors.red.withOpacity(0.1),
//                                             borderRadius: BorderRadius.circular(
//                                               8,
//                                             ),
//                                           ),
//                                           child: const Text(
//                                             "Low Stock",
//                                             style: TextStyle(
//                                               color: Colors.red,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       const SizedBox(width: 10),
//                                       ElevatedButton(
//                                         onPressed: () {
//                                           context.push(
//                                             Pages.barcode,
//                                             extra: p.barcode,
//                                           );
//                                         },
//                                         child: const Text("View Barcode"),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // /// ➕ ADD PRODUCT DIALOG
//   // void _showAddDialog(BuildContext context, WidgetRef ref) {
//   //   final name = TextEditingController();
//   //   final price = TextEditingController();
//   //   final stock = TextEditingController();
//   //   final barcode = TextEditingController();
//   //   final formKey = GlobalKey<FormState>();

//   //   showDialog(
//   //     context: context,
//   //     barrierDismissible: false,

//   //     builder: (_) => AlertDialog(
//   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//   //       title: Row(
//   //         children: [
//   //           Icon(Icons.add_box, color: Colors.blue),
//   //           SizedBox(width: 10),
//   //           Text(
//   //             "Add Product",
//   //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//   //           ),
//   //         ],
//   //       ),
//   //       content: Form(
//   //         key: formKey,
//   //         child: Container(
//   //           padding: const EdgeInsets.all(20),
//   //           width: 400,
//   //           child: SingleChildScrollView(
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: [
//   //                 /// TITLE

//   //                 /// BARCODE FIELD
//   //                 TextFormField(
//   //                   controller: barcode,
//   //                   autofocus: true,
//   //                   decoration: InputDecoration(
//   //                     labelText: "Scan Barcode",

//   //                     prefixIcon: Icon(Icons.qr_code_scanner),
//   //                     // suffixIcon: IconButton(
//   //                     //   icon: Icon(Icons.camera_alt),
//   //                     //   onPressed: () {
//   //                     //     // TODO: Open Scanner
//   //                     //   },
//   //                     // ),
//   //                     border: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                   ),
//   //                 ),

//   //                 const SizedBox(height: 15),

//   //                 /// NAME FIELD
//   //                 TextFormField(
//   //                   controller: name,
//   //                   validator: (value) {
//   //                     if (value == null || value.trim().isEmpty) {
//   //                       return "Product name is required";
//   //                     }
//   //                     return null;
//   //                   },
//   //                   decoration: InputDecoration(
//   //                     labelText: "Product Name",
//   //                     prefixIcon: Icon(Icons.inventory),

//   //                     border: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                   ),
//   //                 ),

//   //                 const SizedBox(height: 15),

//   //                 /// PRICE FIELD
//   //                 TextFormField(
//   //                   controller: price,
//   //                   keyboardType: TextInputType.number,
//   //                   decoration: InputDecoration(
//   //                     labelText: "Price",
//   //                     prefixIcon: Icon(Icons.currency_rupee),
//   //                     border: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                   ),
//   //                   validator: (value) {
//   //                     if (value == null || value.trim().isEmpty) {
//   //                       return "Price is required";
//   //                     }
//   //                     final parsed = double.tryParse(value);
//   //                     if (parsed == null) {
//   //                       return "Enter valid number";
//   //                     }
//   //                     if (parsed < 0) {
//   //                       return "Price cannot be negative";
//   //                     }
//   //                     return null;
//   //                   },
//   //                 ),

//   //                 const SizedBox(height: 15),

//   //                 /// STOCK FIELD
//   //                 TextFormField(
//   //                   controller: stock,
//   //                   keyboardType: TextInputType.number,
//   //                   decoration: InputDecoration(
//   //                     labelText: "Stock",
//   //                     prefixIcon: Icon(Icons.storage),
//   //                     border: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                   ),

//   //                   validator: (value) {
//   //                     if (value == null || value.trim().isEmpty) {
//   //                       return "Stock is required";
//   //                     }
//   //                     final parsed = int.tryParse(value);
//   //                     if (parsed == null) {
//   //                       return "Enter valid integer";
//   //                     }
//   //                     if (parsed < 0) {
//   //                       return "Stock cannot be negative";
//   //                     }
//   //                     return null;
//   //                   },
//   //                 ),

//   //                 const SizedBox(height: 25),

//   //                 /// BUTTONS
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.end,
//   //                   children: [
//   //                     TextButton(
//   //                       onPressed: () => context.pop(),
//   //                       child: Text("Cancel"),
//   //                     ),
//   //                     const SizedBox(width: 10),
//   //                     ElevatedButton(
//   //                       style: ElevatedButton.styleFrom(
//   //                         padding: EdgeInsets.symmetric(
//   //                           horizontal: 20,
//   //                           vertical: 12,
//   //                         ),
//   //                         shape: RoundedRectangleBorder(
//   //                           borderRadius: BorderRadius.circular(12),
//   //                         ),
//   //                       ),
//   //                       onPressed: () async {
//   //                         if (!formKey.currentState!.validate()) return;

//   //                         final notifier = ref.read(
//   //                           productNotifierProvider.notifier,
//   //                         );

//   //                         final product = Product(
//   //                           id: DateTime.now().millisecondsSinceEpoch
//   //                               .toString(),
//   //                           name: name.text.trim(),
//   //                           price: double.tryParse(price.text) ?? 0,
//   //                           stock: int.tryParse(stock.text) ?? 0,
//   //                           barcode: barcode.text.trim(),
//   //                           categoryId: '2',
//   //                         );

//   //                         final showMessage = ScaffoldMessenger.of(context);

//   //                         final message = await notifier.addProduct(product);
//   //                         if (message != null) {
//   //                           showMessage.showSnackBar(
//   //                             SnackBar(content: Text(message)),
//   //                           );
//   //                           return;
//   //                         }
//   //                         if (context.mounted) context.pop();
//   //                       },
//   //                       child: Text("Add Product"),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   void _showEditDialog(BuildContext context, dynamic product, WidgetRef ref) {
//     final formKey = GlobalKey<FormState>();

//     final name = TextEditingController(text: product.name);
//     final price = TextEditingController(text: product.price.toString());
//     final stock = TextEditingController(text: product.stock.toString());

//     showDialog(
//       context: context,
//       builder: (_) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Form(
//           key: formKey,
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             width: 400,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   "Edit Product",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 20),

//                 /// NAME
//                 TextFormField(
//                   controller: name,
//                   decoration: InputDecoration(
//                     labelText: "Product Name",
//                     prefixIcon: Icon(Icons.inventory_2_outlined),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Name is required";
//                     }
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 15),

//                 /// PRICE
//                 TextFormField(
//                   controller: price,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Price",
//                     prefixIcon: Icon(Icons.attach_money),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Price is required";
//                     }
//                     final parsed = double.tryParse(value);
//                     if (parsed == null || parsed <= 0) {
//                       return "Enter valid price";
//                     }
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 15),

//                 /// STOCK
//                 TextFormField(
//                   controller: stock,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Stock",
//                     prefixIcon: Icon(Icons.storage),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Stock is required";
//                     }
//                     final parsed = int.tryParse(value);
//                     if (parsed == null || parsed < 0) {
//                       return "Enter valid stock";
//                     }
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 20),

//                 /// ACTIONS
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () => context.pop(),
//                       child: const Text("Cancel"),
//                     ),

//                     ElevatedButton.icon(
//                       icon: const Icon(Icons.save),
//                       label: const Text("Update"),
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () async {
//                         if (formKey.currentState!.validate()) {
//                           final updatedName = name.text.trim();
//                           final updatedPrice = double.parse(price.text);
//                           final updatedStock = int.parse(stock.text);
//                           final barcode = product.barcode;

//                           final showMessage = ScaffoldMessenger.of(context);

//                           // TODO: call your provider
//                           final result = await ref
//                               .read(productNotifierProvider.notifier)
//                               .updateProduct(
//                                 Product(
//                                   id: product.id,
//                                   name: updatedName,
//                                   price: updatedPrice,
//                                   stock: updatedStock,
//                                   barcode: barcode,
//                                   categoryId: product.categoryId,
//                                 ),
//                               );

//                           if (result) {
//                             showMessage.clearSnackBars();
//                             showMessage.showSnackBar(
//                               SnackBar(content: Text("Product is updated")),
//                             );
//                           } else {
//                             showMessage.clearSnackBars();
//                             showMessage.showSnackBar(
//                               SnackBar(content: Text("Product can't updated")),
//                             );
//                           }

//                           if (context.mounted) context.pop();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showDeleteDialogue(
//     BuildContext context,
//     Product product,
//     WidgetRef ref,
//   ) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Delete", style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(width: 10),
//             Icon(Icons.warning, color: Colors.red),
//           ],
//         ),

//         content: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text("Are you sure you want to delete this product"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               context.pop();
//             },
//             child: Text("No"),
//           ),

//           ElevatedButton(
//             onPressed: () async {
//               final showMessage = ScaffoldMessenger.of(context);

//               final result = await ref
//                   .read(productNotifierProvider.notifier)
//                   .deleteProduct(product.id);

//               if (result) {
//                 showMessage.showSnackBar(
//                   SnackBar(content: Text("${product.name} is deleted")),
//                 );
//               } else {
//                 showMessage.showSnackBar(
//                   SnackBar(content: Text("${product.name} can't deleted")),
//                 );
//               }

//               if (context.mounted) context.pop();
//             },
//             child: Text("Yes"),
//           ),
//         ],
//       ),
//     );
//   }
// }
