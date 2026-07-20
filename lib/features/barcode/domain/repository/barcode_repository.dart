import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';

abstract class BarcodeRepository {
  Future<Result<String>> savePdf({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
    required String fileName,
  });

  Future<Result<String>> printPdf({
     required List<BarcodeItem> items,
    required BarcodeLayout layout,
  });
}
