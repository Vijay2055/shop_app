import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';


extension SaleRowX on Sale {
  SaleEntity toEntity() {
    return SaleEntity(
      id: id,
      invoiceNumber: invoiceNumber,
      customerId: customerId,
      saleType: SaleType.values.byName(saleType),
      status: SaleStatus.values.byName(status),
      subtotal: subtotal,
      discountAmount: discountAmount,
      vatAmount: vatAmount,
      grandTotal: grandTotal,
      paidAmount: paidAmount,
      dueAmount: dueAmount,
      paymentStatus: PaymentStatus.values.byName(paymentStatus),
      note: note,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}