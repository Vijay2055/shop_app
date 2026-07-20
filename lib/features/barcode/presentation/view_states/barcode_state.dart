import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';

part 'barcode_state.freezed.dart';

@freezed
abstract class BarcodeState with _$BarcodeState {
  const factory BarcodeState({
    @Default([]) List<BarcodeItem> items,
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
    @Default(null) String? error,
    @Default(null) String? message,
    @Default(BarcodeLayout.single) BarcodeLayout layout,
  }) = _BarcodeState;
}
