import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';

part 'product_variant_model.freezed.dart';
part 'product_variant_model.g.dart';

@freezed
abstract class ProductVariantModel with _$ProductVariantModel {
  const factory ProductVariantModel({
    required String id,

    @JsonKey(name: 'product_id') required String productId,

    required String sku,

    required String barcode,

    String? color,

    String? size,

    @JsonKey(name: 'cost_price') required double costPrice,

    @JsonKey(name: 'selling_price') required double sellingPrice,

    required double mrp,

    @JsonKey(name: 'vat_percent') @Default(0) double vatPercent,

    @JsonKey(name: 'discount_percent') @Default(0) double discountPercent,

    @Default(0) int stock,

    @JsonKey(name: 'minimum_stock') @Default(5) int minimumStock,

    @JsonKey(name: 'is_active') @Default(true) bool isActive,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProductVariantModel;

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  factory ProductVariantModel.fromEntity(ProductVariantEntity entity) {
    return ProductVariantModel(
      id: entity.id,
      productId: entity.productId,
      sku: entity.sku,
      barcode: entity.barcode,
      color: entity.color,
      size: entity.size,
      costPrice: entity.costPrice,
      sellingPrice: entity.sellingPrice,
      mrp: entity.mrp,
      vatPercent: entity.vatPercent,
      discountPercent: entity.discountPercent,
      stock: entity.stock,
      minimumStock: entity.minimumStock,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

extension ProductVariantModelX on ProductVariantModel {
  ProductVariantEntity toEntity() {
    return ProductVariantEntity(
      id: id,
      productId: productId,
      sku: sku,
      barcode: barcode,
      color: color,
      size: size,
      costPrice: costPrice,
      sellingPrice: sellingPrice,
      mrp: mrp,
      vatPercent: vatPercent,
      discountPercent: discountPercent,
      stock: stock,
      minimumStock: minimumStock,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ProductVariantTableX on ProductVariant {
  ProductVariantModel toModel() {
    return ProductVariantModel(
      id: id,
      productId: productId,
      sku: sku,
      barcode: barcode,
      color: color,
      size: size,
      costPrice: costPrice,
      sellingPrice: sellingPrice,
      mrp: mrp,
      vatPercent: vatPercent,
      discountPercent: discountPercent,
      stock: stock,
      minimumStock: minimumStock,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Model -> Entity

/// Drift Row -> Model

/// Model -> Companion (Insert)
extension ProductVariantModelToCompanion on ProductVariantModel {
  ProductVariantsCompanion toCompanion() {
    return ProductVariantsCompanion.insert(
      id: id,
      productId: productId,
      sku: sku,
      barcode: barcode,
      color: Value(color),
      size: Value(size),
      costPrice: Value(costPrice),
      sellingPrice: Value(sellingPrice),
      mrp: Value(mrp),
      vatPercent: Value(vatPercent),
      discountPercent: Value(discountPercent),
      stock: Value(stock),
      minimumStock: Value(minimumStock),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}

/// Model -> Drift Row (Update)
extension ProductVariantModelToDrift on ProductVariantModel {
  ProductVariant toDrift() {
    return ProductVariant(
      id: id,
      productId: productId,
      sku: sku,
      barcode: barcode,
      color: color,
      size: size,
      costPrice: costPrice,
      sellingPrice: sellingPrice,
      mrp: mrp,
      vatPercent: vatPercent,
      discountPercent: discountPercent,
      stock: stock,
      minimumStock: minimumStock,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
