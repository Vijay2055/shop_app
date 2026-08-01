import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/billing/application/billing_notifier.dart';
import 'package:shop_app/features/billing/presentation/widget/billing_bottom_widget.dart';
import 'package:shop_app/features/billing/presentation/widget/billing_payment_pannel.dart';
import 'package:shop_app/features/billing/presentation/widget/cart_item_view.dart';
import 'package:shop_app/features/billing/presentation/widget/search_product_with_barcode_field.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';

class BillingScreen extends ConsumerWidget {
  BillingScreen({super.key});
  final controller = TextEditingController();

  void _showSnack(
    String message,
    BuildContext context, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(milliseconds: 3000),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartRead = ref.read(cartProvider.notifier);

    ref.listen(cartProvider, (prev, next) {
      final error = next.message;

      if (error != null && error.isNotEmpty) {
        _showSnack(error, context, isError: true);
        // ref.read(cartProvider.notifier).clearMessage();
      }
    });

    ref.listen(billingProvider, (pre, next) {
      final error = next.errorMessage;
      if (error != null && error.isNotEmpty) {
        _showSnack(error, context, isError: true);
        // ref.read(billingProvider.notifier).clearMessages();
      }
    });

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              SearchProductWithBarcodeField(
                onScan: (value) async {
                  await cartRead.searchByBarcode(value);
                },
              ),
              Expanded(child: CartItemView()),
              BillingBottomWidget(),
            ],
          ),
        ),
        Expanded(flex: 1, child: BillingPaymentPannel()),
      ],
    );
  }
}
