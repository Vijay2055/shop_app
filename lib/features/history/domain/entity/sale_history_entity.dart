import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';

class SaleHistoryEntity {
  final String id;
  final String invoiceNumber;

  final DateTime createdAt;

  final String customerName;
  final PaymentStatus paymentStatus;

  /// Total quantity sold in this bill
  final int totalItems;

  final double grandTotal;

  final SaleType saleType;
  final SaleStatus status;

  const SaleHistoryEntity({
    required this.id,
    required this.invoiceNumber,
    required this.createdAt,
    required this.customerName,
    required this.totalItems,
    required this.grandTotal,
    required this.saleType,
    required this.status,
    required this.paymentStatus
  });
}
