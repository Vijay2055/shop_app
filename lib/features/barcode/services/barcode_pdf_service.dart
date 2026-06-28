import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/barcode/config/layout_confing.dart';
import 'package:shop_app/features/barcode/domain/entity/barcode_item.dart';

class BarcodePdfService {
  

  Future<Uint8List> generatePdf({
    required List<BarcodeItem> items,
    required BarcodeLayout layout,
  }) async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.notoSansRegular();

    final config = getLayoutConfig(layout);

    final labels = <BarcodeItem>[];

    for (final item in items) {
      for (int i = 0; i < item.quantity; i++) {
        labels.add(item);
      }
    }

    final labelsPerPage = config.columns * config.rows;

    for (int start = 0; start < labels.length; start += labelsPerPage) {
      final end = (start + labelsPerPage > labels.length)
          ? labels.length
          : start + labelsPerPage;

      final pageLabels = labels.sublist(start, end);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(10),
          build: (context) {
            final pageWidth = PdfPageFormat.a4.availableWidth - 20;

            final pageHeight = PdfPageFormat.a4.availableHeight - 20;

            final labelWidth = pageWidth / config.columns;

            final labelHeight = pageHeight / config.rows;

            return pw.Wrap(
              spacing: 0,
              runSpacing: 0,
              children: pageLabels.map((item) {
                return pw.Container(
                  width: labelWidth,
                  height: labelHeight,
                  child: _buildLabel(item, font, config),
                );
              }).toList(),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  Future<void> printPdf(Uint8List bytes) async {
    await Printing.layoutPdf(onLayout: (_) async => bytes);
  }

  Future<File> savePdf(Uint8List bytes, String fileName) async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$fileName.pdf');

    await file.writeAsBytes(bytes);

    return file;
  }

  
}



pw.Widget _buildLabel(
  BarcodeItem item,
  pw.Font font,
  BarcodeLayoutConfig config,
) {
  final labelHeight = config.heightMm * PdfPageFormat.mm;

  final labelWidth = config.widthMm * PdfPageFormat.mm;

  return pw.Container(
    padding: const pw.EdgeInsets.all(2),

    decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.3)),

    child: pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.center,

      children: [
        pw.Text(
          item.product.name,
          maxLines: 1,
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            font: font,
            fontWeight: pw.FontWeight.bold,
            fontSize: labelHeight * 0.09,
          ),
        ),

        pw.SizedBox(height: labelHeight * 0.03),

        pw.BarcodeWidget(
          barcode: pw.Barcode.code128(),
          data: item.product.barcode,
          width: labelWidth * 0.85,
          height: labelHeight * 0.45,
        ),

        pw.SizedBox(height: labelHeight * 0.02),

        pw.Text(
          item.product.barcode,
          style: pw.TextStyle(font: font, fontSize: labelHeight * 0.07),
        ),
      ],
    ),
  );
}

final pdfServiceProvider=Provider<BarcodePdfService>((ref) => BarcodePdfService());