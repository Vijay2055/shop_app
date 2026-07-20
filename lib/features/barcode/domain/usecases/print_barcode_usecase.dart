import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';
import 'package:shop_app/features/barcode/domain/repository/barcode_repository.dart';

class barcodePrintUsecase {
  final BarcodeRepository _repository;
  barcodePrintUsecase(this._repository);
  Future<Result<String>> call({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
  }) async {
    return await _repository.printPdf(items: items, layout: layout);
  }
}
