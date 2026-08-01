import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/services/printer/utils/printer_logo.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';
import 'package:image/image.dart' as img;

class PosReceiptBuilder {
  Future<List<int>> buildReceipt({
    required List<CartItem> cart,
    required double total,
    required String billNumber, // NEW
  }) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    final logoBytes = await convertToBytes();

    List<int> bytes = [];

    /// FORMAT BILL NO
    final billNo = billNumber;

    /// FORMAT DATE
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

    /// ================= HEADER =================

    if (logoBytes != null) {
      final image = img.decodeImage(logoBytes);

      if (image != null) {
        final resized = img.copyResize(image, width: 200, maintainAspect: true);

        final grayscale = img.grayscale(resized);

        final bw = img.copyResize(
          grayscale,
          width: grayscale.width,
          height: grayscale.height,
        );

        // manual threshold
        for (int y = 0; y < bw.height; y++) {
          for (int x = 0; x < bw.width; x++) {
            final pixel = bw.getPixel(x, y);

            final luma = img.getLuminance(pixel);

            final color = luma < 140
                ? img.ColorRgb8(0, 0, 0) // black
                : img.ColorRgb8(255, 255, 255); // white

            bw.setPixel(x, y, color);
          }
        }

        bytes += generator.imageRaster(bw);

        bytes += generator.feed(2); // spacing after logo
      }
    }

    bytes += generator.text(
      "Hina Enterprises",
      styles: PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );

    bytes += generator.text(
      "Pratappur-3, Somani Chowk, Nawal Parasi",
      styles: PosStyles(align: PosAlign.center),
    );

    bytes += generator.text(
      "Phone: +977-9805505786",
      styles: PosStyles(align: PosAlign.center),
    );

    bytes += generator.hr();

    /// ================= BILL INFO =================

    bytes += generator.row([
      PosColumn(text: 'Bill No:', width: 4, styles: PosStyles(bold: true)),
      PosColumn(
        text: billNo,
        width: 8,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(text: 'Date:', width: 4, styles: PosStyles(bold: true)),
      PosColumn(
        text: formattedDate,
        width: 8,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(text: 'Pan:', width: 4, styles: PosStyles(bold: true)),
      PosColumn(
        text: '611783426',
        width: 8,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.hr();

    /// ================= ITEM HEADER =================

    bytes += generator.row([
      PosColumn(text: 'Item', width: 6, styles: PosStyles(bold: true)),
      PosColumn(
        text: 'Total',
        width: 6,
        styles: PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.hr(ch: '-');

    /// ================= ITEMS =================

    for (final item in cart) {
      final itemTotal = item.variant.sellingPrice * item.quantity;

      /// ITEM NAME
      bytes += generator.text(item.variant.variant, styles: PosStyles(bold: true));

      /// QTY x PRICE + TOTAL
      bytes += generator.row([
        PosColumn(
          text: '${item.quantity} x ${item.variant.sellingPrice.toStringAsFixed(2)}',
          width: 6,
        ),
        PosColumn(
          text: itemTotal.toStringAsFixed(2),
          width: 6,
          styles: PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    bytes += generator.hr();

    /// ================= TOTAL =================

    bytes += generator.row([
      PosColumn(
        text: 'GRAND TOTAL',
        width: 6,
        styles: PosStyles(bold: true, height: PosTextSize.size2),
      ),
      PosColumn(
        text: total.toStringAsFixed(2),
        width: 6,
        styles: PosStyles(
          align: PosAlign.right,
          bold: true,
          height: PosTextSize.size2,
        ),
      ),
    ]);

    bytes += generator.hr();

    /// ================= FOOTER =================

    bytes += generator.text(
      "Thank you for your purchase!",
      styles: PosStyles(align: PosAlign.center),
    );

    bytes += generator.text(
      "Visit Again",
      styles: PosStyles(align: PosAlign.center, bold: true),
    );

    bytes += generator.feed(2);

    /// ================= CUT =================
    bytes += generator.cut();

    return bytes;
  }
}
