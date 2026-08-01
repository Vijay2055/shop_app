import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item_entity.freezed.dart';

@freezed
abstract class SaleItemEntity with _$SaleItemEntity {
  const factory SaleItemEntity({
    required String id,

    required String saleId,

    required String productId,

    required String variantId,

    required String productName,

    required String sku,

    required String barcode,

    String? color,

    required variant,

    required double costPrice,

    required double sellingPrice,

    required double mrp,

    @Default(0) double vatPercent,

    @Default(0) double discountPercent,

    required int quantity,

    required double lineTotal,
  }) = _SaleItemEntity;
}