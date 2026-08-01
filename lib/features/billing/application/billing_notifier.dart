import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/billing/application/billing_sate.dart';
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
      loadingMessage: "Saving bill...",
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

        //         final status = await ref.read(printerServiceProvider)
        //     .getPrinterStatus(defaultPrinter);

        // if (status != PrinterStatus.ready) {
        //   state = state.copyWith(
        //     message: "Printer is not ready.",
        //   );

        // final pdfBytes = await ref.read(pdfServiceProvider)
        //     .generateSalePdf(data.id);

        //----------------------------------
        // Print
        //----------------------------------
        state = state.copyWith(loadingMessage: "Printing...");

        // await ref.read(printerServiceProvider)
        //     .print(pdfBytes);

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

      case FailureResult(:final failure):
        state = state.copyWith(
          isLoading: false,
          loadingMessage: null,
          errorMessage: failure.message,
        );
    }
  }

  void clearMessages() {
    state = state.copyWith(successMessage: null, errorMessage: null);
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
