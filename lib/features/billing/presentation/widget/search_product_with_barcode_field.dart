import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';
import 'package:shop_app/features/product/presentation/providers/product_provider.dart';

class SearchProductWithBarcodeField extends ConsumerStatefulWidget {
  const SearchProductWithBarcodeField({super.key});

  @override
  ConsumerState<SearchProductWithBarcodeField> createState() =>
      _SearchProductWithBarcodeFieldState();
}

class _SearchProductWithBarcodeFieldState
    extends ConsumerState<SearchProductWithBarcodeField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool isProcessing = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleScan(String value) async {
    if (isProcessing || value.trim().isEmpty) return;

    setState(() => isProcessing = true);

    final barcode = value.trim();

    final product = await ref
        .read(productNotifierProvider.notifier)
        .findProductByBarcode(barcode);

    if (product == null) {
      _showSnack("❌ No product found", isError: true);
      _reset();
      return;
    }

    // 🚨 STOCK CHECK (IMPORTANT)
    if (product.stock <= 0) {
      _showSnack("❌ ${product.name} is out of stock", isError: true);
      _reset();
      return;
    }

    final cartNotifier = ref.read(cartProvider.notifier);
    final cart = ref.read(cartProvider);

    final existingItem = cart.items
        .where((e) => e.productId == product.id)
        .firstOrNull;

    final currentQty = existingItem?.quantity ?? 0;

    // 🚨 MAX STOCK CHECK (CART + STOCK)
    if (currentQty >= product.stock) {
      _showSnack(
        "⚠️ No more stock available for ${product.name}",
        isError: true,
      );
      _reset();
      return;
    }

    final item = CartItem(
      name: product.name,
      price: product.price,
      productId: product.id,
      quantity: 1,
      barcode: product.barcode,
    );

    cartNotifier.addToCart(item);

    _showSnack(
      existingItem == null
          ? "✅ Added ${product.name}"
          : "➕ Quantity increased for ${product.name}",
    );

    _reset();
  }

  void _reset() {
    _controller.clear();
    _focusNode.requestFocus();
    setState(() => isProcessing = false);
  }

  void _showSnack(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: true,

        /// 🔥 Trigger scan
        onSubmitted: _handleScan,

        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.qr_code_scanner),
          hintText: "Scan barcode...",

          /// ⏳ Loading indicator
          suffixIcon: isProcessing
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : null,

          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
