import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';

extension SaleItemRowX on SaleItem {
  SaleItemEntity toEntity() {
    return SaleItemEntity(
      id: id,
      saleId: saleId,
      productId: productId,
      variantId: variantId,
      productName: productName,
      sku: sku,
      barcode: barcode,
      color: color,
      variant: variant,
      costPrice: costPrice,
      sellingPrice: sellingPrice,
      mrp: mrp,
      vatPercent: vatPercent,
      discountPercent: discountPercent,
      quantity: quantity,
      lineTotal: lineTotal,
    );
  }
}