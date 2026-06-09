import 'package:flutter/material.dart';
import 'package:shop_app/features/billing/presentation/widget/billing_bottom_widget.dart';
import 'package:shop_app/features/billing/presentation/widget/billing_payment_pannel.dart';
import 'package:shop_app/features/billing/presentation/widget/cart_item_view.dart';
import 'package:shop_app/features/billing/presentation/widget/search_product_with_barcode_field.dart';

class BillingScreen extends StatelessWidget {
  BillingScreen({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              SearchProductWithBarcodeField(),
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
