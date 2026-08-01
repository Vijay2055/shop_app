import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_entity.freezed.dart';

enum SaleType { cash, credit }

enum SaleStatus { completed, cancelled }

enum PaymentStatus { unpaid, partial, paid }

@freezed
abstract class SaleEntity with _$SaleEntity {
  const factory SaleEntity({
    required String id,

    required String invoiceNumber,

    String? customerId,

    required SaleType saleType,

    required SaleStatus status,
    required PaymentStatus paymentStatus,

    required double subtotal,

    @Default(0) double discountAmount,

    @Default(0) double vatAmount,

    required double grandTotal,

    required double paidAmount,

    @Default(0) double dueAmount,

    String? note,

    required DateTime createdAt,

    required DateTime updatedAt,
  }) = _SaleEntity;
}
