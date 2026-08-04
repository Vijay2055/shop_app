import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/services/printer/models/print_job.dart';
import 'package:shop_app/core/services/printer/pos_receipt_builder.dart';
import 'package:shop_app/core/services/printer/providers/print_provider.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/billing/application/billing_sate.dart';
import 'package:shop_app/features/billing/application/message_notifier.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';
import 'package:shop_app/features/sales/data/providers/sales_provider.dart';

class BillingNotifier extends Notifier<BillingState> {
  @override
  BillingState build() {
    return const BillingState();
  }

  void updateReceivedAmount(double amount) {
    state = state.copyWith(receivedAmount: amount);
  }

  Future<void> generateBill(double receivedAmount) async {
    state = state.copyWith(
      isLoading: true,

      successMessage: null,
      errorMessage: null,
    );

    final cart = ref.read(cartProvider);

    final result = await ref.read(completeSaleUseCaseProvider)(
      cart: cart,
      customer: state.customerEntity,
      note: state.note,
      receivedAmount: receivedAmount,
    );

    switch (result) {
      case Success(:final data):
        //----------------------------------
        // Generate PDF
        //----------------------------------
        state = state.copyWith(loadingMessage: "Generating receipt...");

        //   /// BUILD RECEIPT
        final builder = ref.read(posReceiptBuilderProvider);

        final bytes = await builder.buildReceipt(
          billNumber: data.invoiceNumber,
          cart: cart.items,
          total: cart.totalAmount,
        );

        //----------------------------------
        // Queue Print
        //----------------------------------

        ref.read(messageProvider.notifier).showSuccess("Printing...");

        state = state.copyWith(
          loadingMessage: "Printing...",
          successMessage: null,
          errorMessage: null,
        );
        ref
            .read(printQueueProvider)
            .addJob(PrintJob(billId: data.invoiceNumber, bytes: bytes));

        await Future.delayed(const Duration(seconds: 2));

        //----------------------------------
        // Success
        //----------------------------------
        ref.read(cartProvider.notifier).clearCart();

        state = state.copyWith(
          isLoading: false,
          loadingMessage: null,
          successMessage: "Bill generated successfully.",
          errorMessage: null,
        );

        ref
            .read(messageProvider.notifier)
            .showSuccess("Bill generated successfully.");

        break;

      case FailureResult(:final failure):
        state = state.copyWith(
          isLoading: false,
          loadingMessage: null,
          errorMessage: failure.message,
        );

        ref.read(messageProvider.notifier).showError("Product not found.");

        break;
    }
  }

  void clearMessages() {
    state = state.copyWith(
      loadingMessage: null,
      successMessage: null,
      errorMessage: null,
    );
  }

  void setCustomer(CustomerEntity customer) {
    state = state.copyWith(customerEntity: customer);
  }

  void clearCustomer() {
    state = state.copyWith(customerEntity: null);
  }
}

final billingProvider =
    NotifierProvider.autoDispose<BillingNotifier, BillingState>(
      BillingNotifier.new,
    );
