import 'dart:typed_data';

import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';

abstract class BarcodeRepository {
  Future<Result<Uint8List>> generatePdf({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
  });


  Future<Result<String>> savePdf({
    required Uint8List pdfData,
    required String fileName,
  });

}