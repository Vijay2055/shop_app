import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';

class BarcodeGenerationState {
  final bool isLoading;
  final List<BarcodeItem> items;
  final String? error;
  BarcodeGenerationState({required this.isLoading, required this.items, this.error});
}
