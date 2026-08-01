import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/cart/application/cart_state.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';
import 'package:shop_app/features/customer/domain/repository/customer_reposioty.dart';
import 'package:shop_app/features/sales/data/mappers/cart_item_mapper.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';
import 'package:shop_app/features/sales/domain/repositoy/sale_reposioty.dart';
import 'package:uuid/uuid.dart';

class CompleteSaleUseCase {
  final SaleRepository _repository;
  final CustomerRepository _customerRepository;

  const CompleteSaleUseCase(this._repository, this._customerRepository);

  Future<Result<SaleEntity>> call({
    required CartState cart,
    CustomerEntity? customer,
    String? note,
    required double receivedAmount,
  }) async {
    final dueAmount = max(0.0, cart.totalAmount - receivedAmount);

    final paidAmount = receivedAmount;

    final paymentStatus = dueAmount == 0
        ? PaymentStatus.paid
        : receivedAmount == 0
        ? PaymentStatus.unpaid
        : PaymentStatus.partial;

    if (customer != null) {
      final result = await _customerRepository.insertCustomer(customer);
      switch (result) {
        case Success<void>():
          break;
        case FailureResult<void>(:final failure):
          return FailureResult(DatabaseFailure(failure.message));
      }
    }

    final saleId = const Uuid().v4();

    final sale = SaleEntity(
      id: saleId,
      invoiceNumber: "",

      customerId: customer?.id,

      saleType: customer == null ? SaleType.cash : SaleType.credit,

      status: SaleStatus.completed,

      // Total MRP
      subtotal: cart.mrpTotal,

      // Discount shown on bill
      discountAmount: cart.totalDiscount,

      // No VAT for now
      vatAmount: 0,

      // Customer pays selling total
      grandTotal: cart.totalAmount,

      paidAmount: paidAmount,

      dueAmount: dueAmount,
      paymentStatus: paymentStatus,

      note: note,

      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final saleItems = cart.items
        .map((e) => e.toSaleItem(saleId: saleId))
        .toList();

    return _repository.completeSale(sale: sale, saleItems: saleItems);
  }
}
