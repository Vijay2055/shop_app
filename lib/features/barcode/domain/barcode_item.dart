import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_app/features/product/domain/entities/product.dart';

part 'barcode_item.freezed.dart';

@freezed
abstract class BarcodeItem with _$BarcodeItem {
  const factory BarcodeItem({
    required Product product,
    @Default(1) int quantity,
  }) = _BarcodeItem;
}