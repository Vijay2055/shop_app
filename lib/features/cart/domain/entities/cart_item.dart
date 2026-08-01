import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';

class CartItem {
  final ProductVariantEntity variant;
  final int quantity;

  const CartItem({
    required this.variant,
    required this.quantity,
  });

  /// MRP × Qty
  double get mrpTotal => variant.mrp * quantity;

  /// Selling Price × Qty
  double get sellingTotal => variant.sellingPrice * quantity;

  /// Discount for this line
  double get discount => mrpTotal - sellingTotal;

  /// Alias for selling total
  double get total => sellingTotal;

  CartItem copyWith({
    int? quantity,
  }) {
    return CartItem(
      quantity: quantity ?? this.quantity,
      variant: variant,
    );
  }
}
