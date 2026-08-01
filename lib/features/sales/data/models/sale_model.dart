import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_model.freezed.dart';

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    required String id,
    required String invoiceNumber,
    String? customerId,

    required String saleType,
    required String status,

    required double subtotal,
    required double discountAmount,
    required double vatAmount,
    required double grandTotal,

    required double paidAmount,
    required double dueAmount,
    required String paymentStatus,

    String? note,

    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SaleModel;
}


