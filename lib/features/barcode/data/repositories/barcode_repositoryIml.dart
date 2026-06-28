import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';
import 'package:shop_app/features/barcode/domain/repository/barcode_repository.dart';
import 'package:shop_app/features/barcode/services/barcode_pdf_service.dart';

class BarcodeRepositoryiml  implements BarcodeRepository {
  final BarcodePdfService _pdfService;
  BarcodeRepositoryiml(this._pdfService);
  @override
  Future<Result<Uint8List>> generatePdf({required List<BarcodeItem> items, required BarcodeLayout layout}) async {
    try {
    final pdfData=  await _pdfService.generatePdf(items: items, layout: layout);
    return Result.success(pdfData);
    } catch (e) {
      return Result.failure(DatabaseFailure("Failed to generate PDF: ${e.toString()}"));
    }
  }

  @override
  Future<Result<String>> savePdf({required Uint8List pdfData, required String fileName}) async{
   try {
      final result = await _pdfService.savePdf(pdfData, fileName);
      return Result.success("PDF saved successfully at: $result");
   } catch (e) {
      return Result.failure(DatabaseFailure("Failed to save PDF: ${e.toString()}"));
   }
   
  }
}

final barcodeRepositoryProvider = Provider<BarcodeRepository>((ref) {
  final pdfService = ref.read(pdfServiceProvider);
  return BarcodeRepositoryiml(pdfService);
});
