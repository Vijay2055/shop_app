import 'package:uuid/uuid.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';

extension CartItemMapper on CartItem {
  SaleItemEntity toSaleItem({
    required String saleId,
  }) {
    return SaleItemEntity(
      id: const Uuid().v4(),
      saleId: saleId,

      productId: variant.productId,
      variantId: variant.id,

      productName: variant.variant,
      sku: variant.sku,
      barcode: variant.barcode,

      color: variant.color,
      variant: variant.variant,

      costPrice: variant.costPrice,
      sellingPrice: variant.sellingPrice,
      mrp: variant.mrp,

      vatPercent: variant.vatPercent,
      discountPercent: variant.discountPercent,

      quantity: quantity,

      lineTotal: total,
    );
  }
}