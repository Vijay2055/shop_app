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
          margin: pw.EdgeInsets.zero,
          build: (context) {
            return pw.Stack(
              children: List.generate(pageLabels.length, (index) {
                final row = index ~/ config.columns;
                final col = index % config.columns;

                final left =
                    (config.leftMarginMm +
                        col * (config.widthMm + config.horizontalGapMm)) *
                    PdfPageFormat.mm;

                final top =
                    (config.topMarginMm +
                        row * (config.heightMm + config.verticalGapMm)) *
                    PdfPageFormat.mm;

                return pw.Positioned(
                  left: left,
                  top: top,
                  child: pw.Container(
                    width: config.widthMm * PdfPageFormat.mm,
                    height: config.heightMm * PdfPageFormat.mm,
                    child: _buildLabel(pageLabels[index], font, config),
                  ),
                );
              }),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  Future<bool> printPdf(Uint8List bytes) async {
    return await Printing.layoutPdf(onLayout: (_) async => bytes);
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
  return pw.Container(
    alignment: pw.Alignment.center,
    padding: const pw.EdgeInsets.all(2),
    child: pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      children: [
        pw.Text(
          item.product.sku,
          textAlign: pw.TextAlign.center,
          maxLines: 1,
          style: pw.TextStyle(
            font: font,
            fontSize: 8,
            fontWeight: pw.FontWeight.bold,
          ),
        ),

        pw.SizedBox(height: 2),

        pw.BarcodeWidget(
          barcode: pw.Barcode.code128(),
          data: item.product.barcode,
          width: config.widthMm * PdfPageFormat.mm * .80,
          height: config.heightMm * PdfPageFormat.mm * .38,
        ),

        pw.SizedBox(height: 2),

        pw.Text(
          item.product.barcode,
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(font: font, fontSize: 7),
        ),
      ],
    ),
  );
}

final pdfServiceProvider = Provider<BarcodePdfService>(
  (ref) => BarcodePdfService(),
);
