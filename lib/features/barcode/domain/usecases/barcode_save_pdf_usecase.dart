import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';
import 'package:shop_app/features/barcode/domain/repository/barcode_repository.dart';

class BarcodeSavePdfUsecase {
  final BarcodeRepository _repository;
  BarcodeSavePdfUsecase(this._repository);
  Future<Result<String>> call({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
    required String fileName,
  }) async {
    return await _repository.savePdf(
      items: items,
      fileName: fileName,
      layout: layout,
    );
  }
}
