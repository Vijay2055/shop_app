import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';

class ProductVariantDraft {
  final String? id;
  final String sku;
  final String barcode;
  final String? color;
  final String variant;
  final double costPrice;
  final double sellingPrice;
  final double mrp;
  final double vatPercent;
  final double discountPercent;
  final int stock;
  final int minimumStock;
  final bool isActive;

  const ProductVariantDraft({
    required this.sku,
    required this.barcode,
    this.color,
    required this.variant,
    this.id,
    required this.costPrice,
    required this.sellingPrice,
    required this.mrp,
    required this.vatPercent,
    required this.discountPercent,
    required this.stock,
    required this.minimumStock,
    required this.isActive,
  });

  factory ProductVariantDraft.fromEntity(ProductVariantEntity entity) {
    return ProductVariantDraft(
      sku: entity.sku,
      barcode: entity.barcode,
      costPrice: entity.costPrice,
      sellingPrice: entity.sellingPrice,
      mrp: entity.mrp,
      vatPercent: entity.vatPercent,
      discountPercent: entity.discountPercent,
      stock: entity.stock,
      minimumStock: entity.minimumStock,
      isActive: entity.isActive,
      id: entity.id,
      variant: entity.variant
    );
  }
}
