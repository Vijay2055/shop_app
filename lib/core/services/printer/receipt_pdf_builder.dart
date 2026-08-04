import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shop_app/core/services/printer/utils/printer_logo.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';

class ReceiptPdfBuilder {
  Future<Uint8List> buildReceipt({
    required List<CartItem> cart,
    required double total,
    required String billNumber,
  }) async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.notoSansRegular();
    final boldFont = await PdfGoogleFonts.notoSansBold();

    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

    final pageFormat = PdfPageFormat(
      80 * PdfPageFormat.mm,
      297 * PdfPageFormat.mm,
      marginLeft: 4 * PdfPageFormat.mm,
      marginRight: 4 * PdfPageFormat.mm,
      marginTop: 4 * PdfPageFormat.mm,
      marginBottom: 4 * PdfPageFormat.mm,
    );

    final logo = await _buildLogo();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: pageFormat,
        build: (context) {
          return [
            ///===========================
            /// LOGO
            ///===========================
            if (logo != null) pw.Center(child: pw.Image(logo, width: 120)),

            pw.SizedBox(height: 6),

            ///===========================
            /// SHOP NAME
            ///===========================
            pw.Center(
              child: pw.Text(
                "Hina Enterprises",
                style: pw.TextStyle(font: boldFont, fontSize: 18),
              ),
            ),

            pw.Center(
              child: pw.Text(
                "Pratappur-3, Somani Chowk, Nawal Parasi",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: font, fontSize: 10),
              ),
            ),

            pw.Center(
              child: pw.Text(
                "Phone: +977-9805505786",
                style: pw.TextStyle(font: font, fontSize: 10),
              ),
            ),

            pw.Divider(),

            ...cart.expand((item) {
              final itemTotal = item.variant.sellingPrice * item.quantity;

              return [
                pw.Text(
                  item.variant.variant,
                  style: pw.TextStyle(font: boldFont, fontSize: 11),
                ),

                pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 6,
                      child: pw.Text(
                        "${item.quantity} x ${item.variant.sellingPrice.toStringAsFixed(2)}",
                        style: pw.TextStyle(font: font),
                      ),
                    ),
                    pw.Expanded(
                      flex: 6,
                      child: pw.Text(
                        itemTotal.toStringAsFixed(2),
                        textAlign: pw.TextAlign.right,
                        style: pw.TextStyle(font: font),
                      ),
                    ),
                  ],
                ),

                pw.SizedBox(height: 6),
              ];
            }),

            pw.Divider(),

            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Text(
                    "GRAND TOTAL",
                    style: pw.TextStyle(font: boldFont, fontSize: 14),
                  ),
                ),
                pw.Text(
                  total.toStringAsFixed(2),
                  style: pw.TextStyle(font: boldFont, fontSize: 14),
                ),
              ],
            ),

            pw.Divider(),

            pw.Center(
              child: pw.Text(
                "Thank you for your purchase!",
                style: pw.TextStyle(font: font),
              ),
            ),

            pw.Center(
              child: pw.Text(
                "Visit Again",
                style: pw.TextStyle(font: boldFont),
              ),
            ),

            ///===========================
            /// BILL INFO
            ///===========================
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Bill No", style: pw.TextStyle(font: boldFont)),
                pw.Text(billNumber, style: pw.TextStyle(font: font)),
              ],
            ),

            pw.SizedBox(height: 2),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Date", style: pw.TextStyle(font: boldFont)),
                pw.Text(formattedDate, style: pw.TextStyle(font: font)),
              ],
            ),

            pw.SizedBox(height: 2),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("PAN", style: pw.TextStyle(font: boldFont)),
                pw.Text("611783426", style: pw.TextStyle(font: font)),
              ],
            ),

            pw.Divider(),

            ///===========================
            /// TABLE HEADER
            ///===========================
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 6,
                  child: pw.Text("Item", style: pw.TextStyle(font: boldFont)),
                ),
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    "Qty",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(font: boldFont),
                  ),
                ),
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    "Total",
                    textAlign: pw.TextAlign.right,
                    style: pw.TextStyle(font: boldFont),
                  ),
                ),
              ],
            ),

            pw.Divider(),
          ];
        },
      ),
    );

    return pdf.save();
  }

  Future<pw.MemoryImage?> _buildLogo() async {
    final logoBytes = await convertToBytes();

    if (logoBytes == null) {
      return null;
    }

    final image = img.decodeImage(logoBytes);

    if (image == null) {
      return null;
    }

    final resized = img.copyResize(image, width: 200, maintainAspect: true);

    final grayscale = img.grayscale(resized);

    final bw = img.copyResize(
      grayscale,
      width: grayscale.width,
      height: grayscale.height,
    );

    // Convert to pure black & white (same as printer)
    for (int y = 0; y < bw.height; y++) {
      for (int x = 0; x < bw.width; x++) {
        final pixel = bw.getPixel(x, y);

        final luma = img.getLuminance(pixel);

        bw.setPixel(
          x,
          y,
          luma < 140 ? img.ColorRgb8(0, 0, 0) : img.ColorRgb8(255, 255, 255),
        );
      }
    }

    return pw.MemoryImage(Uint8List.fromList(img.encodePng(bw)));
  }

  Future<void> printPdf(Uint8List bytes) async {
    await Printing.layoutPdf(onLayout: (_) async => bytes);
  }
}

final receiptPdfBuilderProvider = Provider<ReceiptPdfBuilder>(
  (ref) => ReceiptPdfBuilder(),
);
