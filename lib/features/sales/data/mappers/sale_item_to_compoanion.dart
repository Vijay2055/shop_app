import 'package:drift/drift.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';

extension SaleItemCompanionX on SaleItemEntity {
  SaleItemsCompanion toCompanion() {
    return SaleItemsCompanion(
      id: Value(id),
      saleId: Value(saleId),

      productId: Value(productId),
      variantId: Value(variantId),

      productName: Value(productName),

      sku: Value(sku),
      barcode: Value(barcode),

      color: Value(color),
      variant: Value(variant),

      costPrice: Value(costPrice),
      sellingPrice: Value(sellingPrice),
      mrp: Value(mrp),

      vatPercent: Value(vatPercent),
      discountPercent: Value(discountPercent),

      quantity: Value(quantity),

      lineTotal: Value(lineTotal),
    );
  }
}
