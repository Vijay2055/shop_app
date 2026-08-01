class SaleHistoryDto {
  final String id;
  final String invoiceNumber;
  final String customerName;
  final int totalItems;
  final double grandTotal;
  final String saleType;
  final String status;
  final String paymentStatus;
  final DateTime createdAt;

  const SaleHistoryDto({
    required this.id,
    required this.invoiceNumber,
    required this.customerName,
    required this.totalItems,
    required this.grandTotal,
    required this.saleType,
    required this.status,
    required this.createdAt,
    required this.paymentStatus,
  });
}
