import 'dart:typed_data';

import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';
import 'package:shop_app/features/barcode/domain/repository/barcode_repository.dart';

class BarcodeGeneratePdfUsecase {
  final BarcodeRepository _repository;
  BarcodeGeneratePdfUsecase(this._repository);
  Future<Result<Uint8List>> call({required List<BarcodeItem> items, required BarcodeLayout layout}) async {
    return await _repository.generatePdf(items: items, layout: layout);
  }
}