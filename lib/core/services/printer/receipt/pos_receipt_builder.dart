import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';

class PosReceiptBuilder {
  Future<List<int>> buildReceipt({
    required List<CartItem> cart,
    required double total,
    required int billNumber, // NEW
  }) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    List<int> bytes = [];

    /// FORMAT BILL NO
    final billNo = 'BILL_${billNumber.toString().padLeft(3, '0')}';

    /// FORMAT DATE
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

    /// ================= HEADER =================

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
