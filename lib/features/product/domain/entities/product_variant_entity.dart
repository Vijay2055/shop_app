class ProductVariantEntity {
  final String id;

  final String productId;

  /// Internal unique code
  final String sku;

  /// Barcode used for scanning
  final String barcode;

  final String? color;

// later do this as varient instead of size, because size is not always applicable to all products
  final String? size;

  final double costPrice;

  final double sellingPrice;

  final double mrp;

  /// Percentage
  final double vatPercent;

  /// Percentage
  final double discountPercent;

  final int stock;

  final int minimumStock;

  final bool isActive;

  final DateTime createdAt;

  final DateTime updatedAt;

  const ProductVariantEntity({
    required this.id,
    required this.productId,
    required this.sku,
    required this.barcode,
    this.color,
    this.size,
    required this.costPrice,
    required this.sellingPrice,
    required this.mrp,
    required this.vatPercent,
    required this.discountPercent,
    required this.stock,
    required this.minimumStock,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}