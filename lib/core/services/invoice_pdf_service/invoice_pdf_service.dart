import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:shop_app/features/history/domain/entity/sale_history_detail_entity.dart';

class InvoicePdfService {
  Future<Uint8List> generate(SaleHistoryDetailEntity sale) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageTheme: _pageTheme(),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _header(sale),
              pw.SizedBox(height: 20),

              invoiceInfo(sale),
              pw.SizedBox(height: 18),

              customerSection(sale),
              pw.SizedBox(height: 18),

              productTable(sale),
              pw.SizedBox(height: 18),
              totalsSection(sale),

              pw.SizedBox(height: 25),

              pw.Text("Header"),
              pw.SizedBox(height: 20),
              pw.Text("Body"),
              pw.SizedBox(height: 20),
              footerSection(sale),

              footerSection(sale),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  pw.PageTheme _pageTheme() {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      theme: pw.ThemeData.withFont(
        base: pw.Font.helvetica(),
        bold: pw.Font.helveticaBold(),
      ),
    );
  }

  //==========================================================
  // HEADER
  //==========================================================

  pw.Widget _header(SaleHistoryDetailEntity sale) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.blue900,
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "YOUR SHOP NAME",
                  style: pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 26,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),

                pw.SizedBox(height: 6),

                pw.Text(
                  "Ahmedabad, Gujarat",
                  style: const pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 11,
                  ),
                ),

                pw.Text(
                  "+91 9876543210",
                  style: const pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 11,
                  ),
                ),

                pw.Text(
                  "GSTIN : XXXXXXXX",
                  style: const pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          pw.Container(
            padding: const pw.EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Text(
              "INVOICE",
              style: pw.TextStyle(
                color: PdfColors.blue900,
                fontWeight: pw.FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //==========================================================
  // INVOICE INFO CARD
  //==========================================================

  pw.Widget invoiceInfo(SaleHistoryDetailEntity sale) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 18),
      padding: const pw.EdgeInsets.all(18),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Row(
        children: [
          pw.Expanded(child: _infoTile("Invoice No", sale.sale.invoiceNumber)),

          pw.Expanded(
            child: _infoTile(
              "Date",
              DateFormat("dd MMM yyyy hh:mm a").format(sale.sale.createdAt),
            ),
          ),

          pw.Expanded(
            child: _infoTile(
              "Payment",
              sale.sale.paymentStatus.name.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _infoTile(String title, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
        ),

        pw.SizedBox(height: 5),

        pw.Text(
          value,
          style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  //==========================================================
  // FOOTER
  //==========================================================

  pw.Widget footerSection(SaleHistoryDetailEntity sale) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 40),
      child: pw.Column(
        children: [
          pw.Divider(),

          if ((sale.sale.note ?? "").isNotEmpty)
            pw.Container(
              width: double.infinity,
              margin: const pw.EdgeInsets.only(bottom: 18),
              padding: const pw.EdgeInsets.all(12),
              decoration: pw.BoxDecoration(
                color: PdfColors.grey100,
                borderRadius: pw.BorderRadius.circular(6),
              ),
              child: pw.Text(
                "Note: ${sale.sale.note}",
                style: const pw.TextStyle(fontSize: 10),
              ),
            ),

          pw.SizedBox(height: 10),

          pw.Text(
            "Thank you for shopping with us!",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 15,
              color: PdfColors.blue900,
            ),
          ),

          pw.SizedBox(height: 6),

          pw.Text(
            "We appreciate your business and look forward to serving you again.",
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
          ),

          pw.SizedBox(height: 25),

          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Generated on ${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.now())}",
                style: const pw.TextStyle(
                  fontSize: 9,
                  color: PdfColors.grey700,
                ),
              ),

              pw.Text(
                "Powered by Shop POS",
                style: const pw.TextStyle(
                  fontSize: 9,
                  color: PdfColors.grey700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //==========================================================
  // CUSTOMER SECTION
  //==========================================================

  pw.Widget customerSection(SaleHistoryDetailEntity sale) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 20),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          //---------------------------------------------------
          // BILL TO
          //---------------------------------------------------
          pw.Expanded(
            flex: 3,
            child: pw.Container(
              padding: const pw.EdgeInsets.all(18),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey300),
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "BILL TO",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 13,
                      color: PdfColors.blue900,
                    ),
                  ),

                  pw.Divider(),

                  _customerRow(
                    "Customer",
                    sale.customer?.name ?? "Walk-in Customer",
                  ),

                  _customerRow("Phone", sale.customer?.phone ?? "-"),

                  _customerRow("Address", sale.customer?.address ?? "-"),
                ],
              ),
            ),
          ),

          pw.SizedBox(width: 20),

          //---------------------------------------------------
          // PAYMENT STATUS
          //---------------------------------------------------
          pw.Expanded(flex: 2, child: paymentCard(sale)),
        ],
      ),
    );
  }

  //==========================================================
  // PAYMENT CARD
  //==========================================================

  pw.Widget paymentCard(SaleHistoryDetailEntity sale) {
    final status = sale.sale.paymentStatus.name;

    PdfColor color;

    switch (status) {
      case "paid":
        color = PdfColors.green;
        break;

      case "partial":
        color = PdfColors.orange;
        break;

      default:
        color = PdfColors.red;
    }

    return pw.Container(
      padding: const pw.EdgeInsets.all(18),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(8),
        border: pw.Border.all(color: PdfColors.grey300),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "PAYMENT",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue900,
              fontSize: 13,
            ),
          ),

          pw.SizedBox(height: 15),

          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: pw.BoxDecoration(
              color: color,
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Text(
              status.toUpperCase(),
              style: pw.TextStyle(
                color: PdfColors.white,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),

          pw.SizedBox(height: 18),

          _amountInfo("Grand Total", sale.sale.grandTotal),

          pw.SizedBox(height: 10),

          _amountInfo("Paid", sale.sale.paidAmount),

          pw.SizedBox(height: 10),

          _amountInfo(
            sale.sale.dueAmount > 0 ? "Due" : "Change",
            sale.sale.dueAmount > 0
                ? sale.sale.dueAmount
                : (sale.sale.paidAmount - sale.sale.grandTotal),
          ),
        ],
      ),
    );
  }

  //==========================================================
  // HELPERS
  //==========================================================

  pw.Widget _customerRow(String title, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 70,
            child: pw.Text(
              "$title :",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Expanded(child: pw.Text(value)),
        ],
      ),
    );
  }

  pw.Widget _amountInfo(String title, double value) {
    return pw.Row(
      children: [
        pw.Expanded(child: pw.Text(title)),
        pw.Text(
          "₹ ${value.toStringAsFixed(2)}",
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  //==========================================================
  // PRODUCT TABLE
  //==========================================================

  pw.Widget productTable(SaleHistoryDetailEntity sale) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 24),
      child: pw.Table(
        border: pw.TableBorder.all(color: PdfColors.grey300, width: .5),
        columnWidths: const {
          0: pw.FixedColumnWidth(35),
          1: pw.FlexColumnWidth(5),
          2: pw.FixedColumnWidth(55),
          3: pw.FixedColumnWidth(75),
          4: pw.FixedColumnWidth(80),
        },
        children: [
          //--------------------------------------------------
          // Header
          //--------------------------------------------------
          pw.TableRow(
            decoration: const pw.BoxDecoration(color: PdfColors.blue900),
            children: [
              _tableHeader("#"),
              _tableHeader("Product"),
              _tableHeader("Qty"),
              _tableHeader("Price"),
              _tableHeader("Total"),
            ],
          ),

          //--------------------------------------------------
          // Rows
          //--------------------------------------------------
          ...List.generate(sale.items.length, (index) {
            final item = sale.items[index];

            return pw.TableRow(
              decoration: pw.BoxDecoration(
                color: index.isEven ? PdfColors.white : PdfColors.grey100,
              ),
              children: [
                _tableCell("${index + 1}", center: true),

                _productCell(item),

                _tableCell(item.quantity.toString(), center: true),

                _tableCell(
                  "₹${item.sellingPrice.toStringAsFixed(2)}",
                  right: true,
                ),

                _tableCell(
                  "₹${item.lineTotal.toStringAsFixed(2)}",
                  right: true,
                  bold: true,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  //==========================================================
  // PRODUCT NAME CELL
  //==========================================================

  pw.Widget _productCell(dynamic item) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            item.productName,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
          ),

          if ((item.variant ?? "").isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 2),
              child: pw.Text(
                item.variant,
                style: const pw.TextStyle(
                  color: PdfColors.grey700,
                  fontSize: 9,
                ),
              ),
            ),

          if ((item.barcode ?? "").isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 2),
              child: pw.Text(
                "Barcode : ${item.barcode}",
                style: const pw.TextStyle(
                  color: PdfColors.grey600,
                  fontSize: 8,
                ),
              ),
            ),
        ],
      ),
    );
  }

  //==========================================================
  // HEADER CELL
  //==========================================================

  pw.Widget _tableHeader(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: pw.Text(
        text,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          color: PdfColors.white,
          fontWeight: pw.FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }

  //==========================================================
  // NORMAL CELL
  //==========================================================

  pw.Widget _tableCell(
    String text, {
    bool center = false,
    bool right = false,
    bool bold = false,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        textAlign: center
            ? pw.TextAlign.center
            : right
            ? pw.TextAlign.right
            : pw.TextAlign.left,
        style: pw.TextStyle(
          fontSize: 10,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
    );
  }

  //==========================================================
  // TOTALS
  //==========================================================

  pw.Widget totalsSection(SaleHistoryDetailEntity sale) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Container(
        width: 260,
        margin: const pw.EdgeInsets.only(top: 25),
        padding: const pw.EdgeInsets.all(18),
        decoration: pw.BoxDecoration(
          color: PdfColors.grey100,
          borderRadius: pw.BorderRadius.circular(8),
          border: pw.Border.all(color: PdfColors.grey300),
        ),
        child: pw.Column(
          children: [
            _totalRow("Subtotal", sale.sale.subtotal),

            pw.SizedBox(height: 8),

            _totalRow("Discount", sale.sale.discountAmount),

            pw.SizedBox(height: 8),

            _totalRow("VAT", sale.sale.vatAmount),

            pw.Divider(),

            _totalRow(
              "Grand Total",
              sale.sale.grandTotal,
              bold: true,
              size: 15,
            ),

            pw.SizedBox(height: 10),

            _totalRow("Paid", sale.sale.paidAmount, color: PdfColors.green800),

            pw.SizedBox(height: 8),

            _totalRow(
              sale.sale.dueAmount > 0 ? "Due" : "Change",
              sale.sale.dueAmount > 0
                  ? sale.sale.dueAmount
                  : (sale.sale.paidAmount - sale.sale.grandTotal),
              color: sale.sale.dueAmount > 0
                  ? PdfColors.orange800
                  : PdfColors.green800,
              bold: true,
            ),
          ],
        ),
      ),
    );
  }

  pw.Widget _totalRow(
    String title,
    double amount, {
    bool bold = false,
    double size = 12,
    PdfColor color = PdfColors.black,
  }) {
    return pw.Row(
      children: [
        pw.Expanded(
          child: pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: size,
              fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
        ),
        pw.Text(
          "₹${amount.toStringAsFixed(2)}",
          style: pw.TextStyle(
            fontSize: size,
            color: color,
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
