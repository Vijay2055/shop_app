import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/services/printer/models/print_job.dart';
import 'package:shop_app/core/services/printer/providers/print_provider.dart';
import 'package:shop_app/core/services/printer/pos_receipt_builder.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';
import 'package:shop_app/features/history/presentation/provider/history_notifier.dart';
import 'package:shop_app/features/udhar/presentation/providers/selected_udhar_provider.dart';

class BillingBottomWidget extends ConsumerWidget {
  const BillingBottomWidget({super.key});

  void _onPressed(BuildContext context, WidgetRef ref) async {
    final cartState = ref.read(cartProvider);
    try {
      final selectedUdhar = ref.read(selectedUdharProvider);
      if (cartState.items.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Cart is empty")));
        return;
      }

      /// CREATE BILL
      final bill = await ref
          .read(historyProvider.notifier)
          .createBill(
            items: cartState.items,
            total: cartState.totalAmount,
            udharId: selectedUdhar,
            status: selectedUdhar == null ? "completed" : "pending",
          );

      /// BUILD RECEIPT
      final builder = PosReceiptBuilder();

      final bytes = await builder.buildReceipt(
        billNumber: bill,
        cart: cartState.items,
        total: cartState.totalAmount,
      );

      /// ADD TO PRINT QUEUE
      ref.read(printQueueProvider).addJob(PrintJob(billId: bill, bytes: bytes));

      /// CLEAR STATE
      ref.read(cartProvider.notifier).clearCart();

      ref.read(selectedUdharProvider.notifier).clear();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Receipt added to print queue")),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

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
          Text(
            "Items: ${cartState.items.length}",
            style: const TextStyle(fontSize: 16),
          ),

          Text(
            "₹${cartState.totalAmount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          ElevatedButton.icon(
            onPressed: () => _onPressed(context, ref),
            // onPressed: () async {

            //   ref
            //       .read(historyProvider.notifier)
            //       .createBill(
            //         items: cartState.items,
            //         total: cartState.totalAmount,
            //         udharId: ref.read(selectedUdharProvider),
            //         status: ref.read(selectedUdharProvider) == null
            //             ? "completed"
            //             : "pending", // <-- set status here, replace with actual logic
            //         // Example status, replace with actual logic
            //       );

            //   final builder = PosReceiptBuilder();

            //   final bytes = await builder.buildReceipt(
            //     billNumber: 1,
            //     cart: cartState.items,
            //     total: cartState.totalAmount,
            //   );

            //   final printer = WindowsPrintService("POS80");
            //   if (!printer.checkPrinterAvailable()) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("❌ Printer not found or offline"),
            //         backgroundColor: Colors.red,
            //       ),
            //     );
            //     return;
            //   }

            //   final success = printer.printBytes(bytes);

            //   if (success) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("✅ Printed successfully"),
            //         backgroundColor: Colors.green,
            //       ),
            //     );
            //     ref.read(selectedUdharProvider.notifier).clear();
            //   } else {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("❌ Print failed"),
            //         backgroundColor: Colors.red,
            //       ),
            //     );
            //   }
            // },
            icon: const Icon(Icons.print, color: Colors.white),
            label: const Text("Print", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              backgroundColor: Color.fromARGB(255, 7, 37, 94),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
