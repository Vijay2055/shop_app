import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';
import 'package:shop_app/features/barcode/domain/repository/barcode_repository.dart';
import 'package:shop_app/features/barcode/services/barcode_pdf_service.dart';
import 'package:shop_app/features/barcode/utils/barcode_generator.dart';

class BarcodeRepositoryiml implements BarcodeRepository {
  final BarcodePdfService _pdfService;
  BarcodeRepositoryiml(this._pdfService);

  @override
  Future<Result<String>> savePdf({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
    required String fileName,
  }) async {
    try {
      final pdfData = await generatePdf(
        items: items,
        layout: layout,
        service: _pdfService,
      );
      final result = await _pdfService.savePdf(pdfData, fileName);
      return Success("PDF saved successfully at: $result");
    } catch (e) {
      return FailureResult(
        DatabaseFailure("Failed to save PDF: ${e.toString()}"),
      );
    }
  }

  @override
  Future<Result<String>> printPdf({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
  }) async {
    try {
      final pdfData = await generatePdf(
        items: items,
        layout: layout,
        service: _pdfService,
      );
      final result = await _pdfService.printPdf(pdfData);
      if (result) {
        return Success("Barcode is printed Successful");
      } else {
        return FailureResult(DatabaseFailure("Failed to print barcode"));
      }
    } catch (e) {
      return FailureResult(
        DatabaseFailure("Failed to save print: ${e.toString()}"),
      );
    }
  }
}

final barcodeRepositoryProvider = Provider<BarcodeRepository>((ref) {
  final pdfService = ref.read(pdfServiceProvider);
  return BarcodeRepositoryiml(pdfService);
});
