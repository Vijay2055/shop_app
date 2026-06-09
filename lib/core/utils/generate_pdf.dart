import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';

Future<void> generateThermalBill(List<CartItem> cart, double total) async {
  final pdf = pw.Document();

  final font = await PdfGoogleFonts.notoSansRegular();
  final boldFont = await PdfGoogleFonts.notoSansBold();

  final now = DateTime.now();
  final formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(now);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, double.infinity),
      margin: const pw.EdgeInsets.all(8),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            /// 🏪 HEADER
            pw.Center(
              child: pw.Text(
                "SONU ALI ENTERPRISE",
                style: pw.TextStyle(font: boldFont, fontSize: 14),
              ),
            ),
            pw.SizedBox(height: 2),

            pw.Center(
              child: pw.Text(
                "Pratappur-4, Nawalparasi",
                style: pw.TextStyle(font: font, fontSize: 9),
              ),
            ),

            pw.SizedBox(height: 6),
            pw.Divider(thickness: 1),

            /// 📅 DATE
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Date:", style: pw.TextStyle(font: font, fontSize: 8)),
                pw.Text(
                  formattedDate,
                  style: pw.TextStyle(font: font, fontSize: 8),
                ),
              ],
            ),

            pw.SizedBox(height: 5),
            pw.Divider(),

            /// 🧾 TABLE HEADER
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Item",
                  style: pw.TextStyle(font: boldFont, fontSize: 9),
                ),
                pw.Text(
                  "Total",
                  style: pw.TextStyle(font: boldFont, fontSize: 9),
                ),
              ],
            ),

            pw.SizedBox(height: 4),

            /// 🛒 ITEMS
            ...cart.map((item) {
              return pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 4),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      item.name,
                      style: pw.TextStyle(font: font, fontSize: 9),
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "${item.quantity} x ₹${item.price}",
                          style: pw.TextStyle(font: font, fontSize: 8),
                        ),
                        pw.Text(
                          "₹${(item.price * item.quantity).toStringAsFixed(2)}",
                          style: pw.TextStyle(font: font, fontSize: 9),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            pw.Divider(thickness: 1),

            /// 💰 TOTAL
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "TOTAL",
                  style: pw.TextStyle(font: boldFont, fontSize: 12),
                ),
                pw.Text(
                  "₹${total.toStringAsFixed(2)}",
                  style: pw.TextStyle(font: boldFont, fontSize: 12),
                ),
              ],
            ),

            pw.SizedBox(height: 10),

            /// 🙏 THANK YOU
            pw.Center(
              child: pw.Text(
                "Thank You! Visit Again 🙏",
                style: pw.TextStyle(font: font, fontSize: 9),
              ),
            ),

            pw.SizedBox(height: 6),

            /// 👨‍💻 DEVELOPER CREDIT
            pw.Center(
              child: pw.Text(
                "Developed by Vijay Yadav",
                style: pw.TextStyle(
                  font: font,
                  fontSize: 7,
                  color: PdfColors.grey,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  /// SAVE + OPEN
  final dir = await getApplicationDocumentsDirectory();
  final file = File("${dir.path}/receipt.pdf");

  await file.writeAsBytes(await pdf.save());

  await OpenFile.open(file.path);
}
