import 'dart:math';

import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';

class BillingState {
  final bool isLoading;
  final String? loadingMessage;
  final String? successMessage;
  final String? errorMessage;
  final CustomerEntity? customerEntity;
  final String? note;
  final double receivedAmount;

  const BillingState({
    this.isLoading = false,
    this.loadingMessage,
    this.successMessage,
    this.errorMessage,
    this.customerEntity,
    this.note,
    this.receivedAmount = 0,
  });

  BillingState copyWith({
    bool? isLoading,
    String? loadingMessage,
    String? successMessage,
    String? errorMessage,
    CustomerEntity? customerEntity,
    String? note,
    double? receivedAmount,
  }) {
    return BillingState(
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      customerEntity: customerEntity ?? this.customerEntity,
      note: note ?? this.note,
      receivedAmount: receivedAmount ?? this.receivedAmount,
    );
  }

  //   double get due =>
  //     max(0, customerEntity. - receivedAmount);

  // double get change =>
  //     max(0, receivedAmount - grandTotal);
}
