import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';

class BillingBottomWidget extends ConsumerWidget {
  const BillingBottomWidget({super.key});

 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   "Items: ${cartState.items.length}",
          //   style: const TextStyle(fontSize: 16),
          // ),
          Text(
            "Total: ₹${cartState.mrpTotal}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          Text(
            "Discount: ₹${cartState.totalDiscount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          Text(
            "Grand Total: ₹${cartState.totalAmount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          
        ],
      ),
    );
  }
}
