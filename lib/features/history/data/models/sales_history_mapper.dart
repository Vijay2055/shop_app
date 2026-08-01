import 'package:shop_app/features/history/data/dto/sales_history_dto.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';

extension SaleHistoryDtoX on SaleHistoryDto {
  SaleHistoryEntity toEntity() {
    return SaleHistoryEntity(
      id: id,
      invoiceNumber: invoiceNumber,
      customerName: customerName,
      totalItems: totalItems,
      grandTotal: grandTotal,
      saleType: SaleType.values.byName(saleType),
      status: SaleStatus.values.byName(status),
      createdAt: createdAt,
      paymentStatus: PaymentStatus.values.byName(paymentStatus)
    );
  }
}

extension SaleHistoryEntityX on SaleHistoryEntity {
  SaleHistoryDto toDto() {
    return SaleHistoryDto(
      id: id,
      invoiceNumber: invoiceNumber,
      customerName: customerName,
      totalItems: totalItems,
      grandTotal: grandTotal,
      saleType: saleType.name,
      status: status.name,
      createdAt: createdAt,
      paymentStatus: paymentStatus.name
    );
  }
}
