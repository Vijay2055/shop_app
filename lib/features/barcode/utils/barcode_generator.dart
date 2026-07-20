  import 'dart:typed_data';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';
import 'package:shop_app/features/barcode/services/barcode_pdf_service.dart';

Future<Uint8List> generatePdf({required List<BarcodeItem> items, required BarcodeLayout layout,required BarcodePdfService service}) async {
    try {
    final pdfData=  await service.generatePdf(items: items, layout: layout);
    return pdfData;
    } catch (e) {
      throw Exception("Failed to generate PDF: ${e.toString()}");
    }
  }