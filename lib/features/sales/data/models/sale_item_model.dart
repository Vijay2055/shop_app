import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item_model.freezed.dart';

@freezed
abstract class SaleItemModel with _$SaleItemModel {
  const factory SaleItemModel({
    required String id,
    required String saleId,

    required String productId,
    required String variantId,

    required String productName,

    required String sku,
    required String barcode,

    String? color,
    required String variant,

    required double costPrice,
    required double sellingPrice,
    required double mrp,

    required double vatPercent,
    required double discountPercent,

    required int quantity,

    required double lineTotal,
  }) = _SaleItemModel;
}


