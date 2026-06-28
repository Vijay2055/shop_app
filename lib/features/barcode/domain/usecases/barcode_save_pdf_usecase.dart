import 'dart:typed_data';

import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/repository/barcode_repository.dart';

class BarcodeSavePdfUsecase {
  final BarcodeRepository _repository;
  BarcodeSavePdfUsecase(this._repository);
  Future<Result<String>> call({required Uint8List pdfData, required String fileName}) async {
    return await _repository.savePdf(pdfData: pdfData, fileName: fileName);
  }
}