import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/features/category/presentation/providers/category_provider.dart';
import 'package:shop_app/features/product/domain/entities/product.dart';
import 'package:shop_app/features/product/presentation/providers/product_provider.dart';

void showAddDialog(BuildContext context, WidgetRef ref) {
  final name = TextEditingController();
  final price = TextEditingController();
  final stock = TextEditingController();
  final barcode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final selectedCategory = ValueNotifier<String?>(null);

  showDialog(
    context: context,
    barrierDismissible: false,

    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Icon(Icons.add_box, color: Colors.blue),
          SizedBox(width: 10),
          Text(
            "Add Product",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE

                /// BARCODE FIELD
                TextFormField(
                  controller: barcode,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Scan Barcode",

                    prefixIcon: Icon(Icons.qr_code_scanner),
                    // suffixIcon: IconButton(
                    //   icon: Icon(Icons.camera_alt),
                    //   onPressed: () {
                    //     // TODO: Open Scanner
                    //   },
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// NAME FIELD
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Product name is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    prefixIcon: Icon(Icons.inventory),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// PRICE FIELD
                TextFormField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Price",
                    prefixIcon: Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Price is required";
                    }
                    final parsed = double.tryParse(value);
                    if (parsed == null) {
                      return "Enter valid number";
                    }
                    if (parsed < 0) {
                      return "Price cannot be negative";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                /// STOCK FIELD
                TextFormField(
                  controller: stock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Stock",
                    prefixIcon: Icon(Icons.storage),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Stock is required";
                    }
                    final parsed = int.tryParse(value);
                    if (parsed == null) {
                      return "Enter valid integer";
                    }
                    if (parsed < 0) {
                      return "Stock cannot be negative";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(border: InputBorder.none),
                      hint: Text(
                        "Select Category",
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      items: ref
                          .watch(categoryProvider)
                          .when(
                            data: (categories) => categories
                                .map(
                                  (cat) => DropdownMenuItem<String>(
                                    value: cat.category.id,
                                    child: Text(cat.category.name),
                                  ),
                                )
                                .toList(),
                            loading: () => [
                              DropdownMenuItem(
                                value: null,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                            error: (e, st) => [
                              DropdownMenuItem(
                                value: null,
                                child: Text("Failed to load categories"),
                              ),
                            ],
                          ),
                      onChanged: (value) {
                        selectedCategory.value = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                /// BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text("Cancel"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return;
                        if (selectedCategory.value == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please select a category")),
                          );
                          return;
                        }

                        final notifier = ref.read(
                          productNotifierProvider.notifier,
                        );

                        final product = Product(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: name.text.trim(),
                          price: double.tryParse(price.text) ?? 0,
                          stock: int.tryParse(stock.text) ?? 0,
                          barcode: barcode.text.trim(),
                          categoryId: selectedCategory.value!,
                        );

                        final showMessage = ScaffoldMessenger.of(context);

                        final message = await notifier.addProduct(product);
                        if (message != null) {
                          showMessage.showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                          return;
                        }
                        ref.invalidate(categoryProvider);
                        if (context.mounted) context.pop();
                      },
                      child: Text("Add Product"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
