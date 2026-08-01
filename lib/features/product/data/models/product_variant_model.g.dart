// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductVariantModel _$ProductVariantModelFromJson(Map<String, dynamic> json) =>
    _ProductVariantModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      sku: json['sku'] as String,
      barcode: json['barcode'] as String,
      color: json['color'] as String?,
      variant: json['variant'] as String,
      costPrice: (json['cost_price'] as num).toDouble(),
      sellingPrice: (json['selling_price'] as num).toDouble(),
      mrp: (json['mrp'] as num).toDouble(),
      vatPercent: (json['vat_percent'] as num?)?.toDouble() ?? 0,
      discountPercent: (json['discount_percent'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      minimumStock: (json['minimum_stock'] as num?)?.toInt() ?? 5,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProductVariantModelToJson(
  _ProductVariantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'color': instance.color,
  'variant': instance.variant,
  'cost_price': instance.costPrice,
  'selling_price': instance.sellingPrice,
  'mrp': instance.mrp,
  'vat_percent': instance.vatPercent,
  'discount_percent': instance.discountPercent,
  'stock': instance.stock,
  'minimum_stock': instance.minimumStock,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
