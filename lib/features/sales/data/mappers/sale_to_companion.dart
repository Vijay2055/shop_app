import 'package:drift/drift.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';

extension SaleCompanionX on SaleEntity {
  SalesCompanion toCompanion() {
    return SalesCompanion(
      id: Value(id),
      invoiceNumber: Value(invoiceNumber),
      customerId: Value(customerId),
      saleType: Value(saleType.name),
      status: Value(status.name),

      subtotal: Value(subtotal),
      discountAmount: Value(discountAmount),
      vatAmount: Value(vatAmount),
      grandTotal: Value(grandTotal),

      paidAmount: Value(paidAmount),
      dueAmount: Value(dueAmount),
      paymentStatus: Value(paymentStatus.name),

      note: Value(note),

      createdAt: Value(createdAt.millisecondsSinceEpoch),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch),
    );
  }
}
