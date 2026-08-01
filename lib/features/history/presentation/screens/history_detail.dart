import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/features/history/presentation/provider/sale_detial_notifier.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';

class SaleDetailScreen extends ConsumerStatefulWidget {
  const SaleDetailScreen({super.key, required this.saleId});

  final String saleId;

  @override
  ConsumerState<SaleDetailScreen> createState() => _SaleDetailScreenState();
}

class _SaleDetailScreenState extends ConsumerState<SaleDetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(saleDetailProvider.notifier).load(widget.saleId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(saleDetailProvider);

    if (state.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Sale Details")),
        body: Center(child: Text(state.error!)),
      );
    }

    if (state.sale == null) {
      return Center(child: Text("No sale found"));
    }

    final sale = state.sale!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              //--------------------------------------------------
              // Header
              //--------------------------------------------------
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.receipt_long_rounded,
                        size: 34,
                        color: Colors.indigo.shade700,
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "SALE INVOICE",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "Invoice #${sale.sale.invoiceNumber}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade700,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            DateFormat(
                              "dd MMM yyyy • hh:mm a",
                            ).format(sale.sale.createdAt),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: sale.sale.status.name == "completed"
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: sale.sale.status.name == "completed"
                              ? Colors.green.shade300
                              : Colors.red.shade300,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            sale.sale.status.name == "completed"
                                ? Icons.check_circle
                                : Icons.cancel,
                            size: 18,
                            color: sale.sale.status.name == "completed"
                                ? Colors.green.shade700
                                : Colors.red.shade700,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            sale.sale.status.name.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: sale.sale.status.name == "completed"
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-------------------------------------------------------
                    // CUSTOMER CARD
                    //-------------------------------------------------------
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Customer Information",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            _detailRow(
                              Icons.badge_outlined,
                              "Name",
                              sale.customer?.name ?? "Walk-in Customer",
                            ),

                            const SizedBox(height: 12),

                            _detailRow(
                              Icons.phone_outlined,
                              "Phone",
                              sale.customer?.phone ?? "-",
                            ),

                            const SizedBox(height: 12),

                            _detailRow(
                              Icons.location_on_outlined,
                              "Address",
                              sale.customer?.address ?? "-",
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    //-------------------------------------------------------
                    // PAYMENT CARD
                    //-------------------------------------------------------
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.payments_outlined,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Payment",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 22),

                            _paymentTile(
                              "Status",
                              sale.sale.paymentStatus.name.toUpperCase(),
                              sale.sale.paymentStatus == PaymentStatus.paid
                                  ? Colors.green
                                  : sale.sale.paymentStatus ==
                                        PaymentStatus.partial
                                  ? Colors.orange
                                  : Colors.red,
                            ),

                            const SizedBox(height: 15),

                            _paymentTile(
                              "Paid",
                              "₹${sale.sale.paidAmount.toStringAsFixed(2)}",
                              Colors.blue,
                            ),

                            const SizedBox(height: 15),

                            _paymentTile(
                              sale.sale.dueAmount > 0 ? "Due" : "Change",
                              sale.sale.dueAmount > 0
                                  ? "₹${sale.sale.dueAmount.toStringAsFixed(2)}"
                                  : "₹${(sale.sale.paidAmount - sale.sale.grandTotal).toStringAsFixed(2)}",
                              sale.sale.dueAmount > 0
                                  ? Colors.orange
                                  : Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //-------------------------------------------------------------
                  // PRODUCTS TABLE
                  //-------------------------------------------------------------
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xffF8FAFC),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Product",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "MRP",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Qty",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Price",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: sale.items.length,
                            separatorBuilder: (_, __) =>
                                Divider(height: 1, color: Colors.grey.shade200),
                            itemBuilder: (context, index) {
                              final item = sale.items[index];

                              return Container(
                                color: index.isEven
                                    ? Colors.white
                                    : const Color(0xffFAFAFA),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        item.productName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(item.mrp.toString()),
                                      ),
                                    ),

                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(item.quantity.toString()),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "₹${item.sellingPrice.toStringAsFixed(2)}",
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "₹${item.lineTotal.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 24),

                  //-------------------------------------------------------------
                  // SUMMARY CARD
                  //-------------------------------------------------------------
                  SizedBox(
                    width: 280,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Payment Summary",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          _summaryRow("Subtotal", sale.sale.subtotal),

                          const SizedBox(height: 12),

                          _summaryRow("Discount", sale.sale.discountAmount),

                          const SizedBox(height: 12),

                          _summaryRow("VAT", sale.sale.vatAmount),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Divider(color: Colors.grey.shade300),
                          ),

                          _summaryRow(
                            "Grand Total",
                            sale.sale.grandTotal,
                            bold: true,
                          ),

                          const SizedBox(height: 12),

                          _summaryRow(
                            "Paid",
                            sale.sale.paidAmount,
                            color: Colors.green,
                          ),

                          const SizedBox(height: 12),

                          _summaryRow(
                            sale.sale.dueAmount > 0 ? "Due" : "Change",
                            sale.sale.dueAmount > 0
                                ? sale.sale.dueAmount
                                : sale.sale.paidAmount - sale.sale.grandTotal,
                            color: sale.sale.dueAmount > 0
                                ? Colors.orange
                                : Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //--------------------------------------------
              // Products Table
              //--------------------------------------------
              if ((sale.sale.note ?? "").isNotEmpty) ...[
                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.sticky_note_2_outlined,
                              color: Colors.amber.shade700,
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Text(
                            "Notes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Text(
                        sale.sale.note!,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //---------------------------------------------------------
                  // PRINT
                  //---------------------------------------------------------

                  //---------------------------------------------------------
                  // PDF
                  //---------------------------------------------------------
                  // OutlinedButton.icon(
                  //   onPressed: () async {
                  //     final pdfBytes = await InvoicePdfService().generate(sale);

                  //     if (!context.mounted) return;

                  //     context.push(Pages.pdfPreview, extra: pdfBytes);
                  //   },
                  //   icon: const Icon(Icons.picture_as_pdf),
                  //   label: const Text("Export PDF"),
                  //   style: OutlinedButton.styleFrom(
                  //     minimumSize: const Size(150, 48),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  // ),
                  if (sale.sale.dueAmount > 0) ...[
                    const SizedBox(width: 14),

                    //---------------------------------------------------------
                    // RECEIVE PAYMENT
                    //---------------------------------------------------------
                    ElevatedButton.icon(
                      onPressed: () async {
                        final amount = await showReceivePaymentDialog(
                          context: context,
                          dueAmount: sale.sale.dueAmount,
                          paidAmount: sale.sale.paidAmount,
                          totalAmount: sale.sale.grandTotal,
                        );

                        if (amount != null) {
                          ref
                              .read(saleDetailProvider.notifier)
                              .receivePayment(
                                saleId: sale.sale.id,
                                amount: amount,
                              );
                        }
                      },
                      icon: const Icon(Icons.payments_outlined),
                      label: const Text("Receive Payment"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        minimumSize: const Size(185, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(width: 14),

                  //---------------------------------------------------------
                  // CLOSE
                  //---------------------------------------------------------
                  FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("Close"),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(120, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _detailRow(IconData icon, String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 18, color: Colors.grey.shade600),
      const SizedBox(width: 10),
      SizedBox(
        width: 80,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    ],
  );
}

Widget _paymentTile(String title, String value, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    decoration: BoxDecoration(
      color: color.withOpacity(.08),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget _summaryRow(
  String title,
  double amount, {
  bool bold = false,
  Color? color,
}) {
  final style = TextStyle(
    fontSize: bold ? 18 : 15,
    fontWeight: bold ? FontWeight.bold : FontWeight.w500,
    color: color,
  );

  return Row(
    children: [
      Expanded(child: Text(title, style: style)),
      Text("₹${amount.toStringAsFixed(2)}", style: style),
    ],
  );
}

// popup

Future<double?> showReceivePaymentDialog({
  required BuildContext context,
  required double totalAmount,
  required double paidAmount,
  required double dueAmount,
}) {
  final controller = TextEditingController();

  double receiveAmount = 0;

  return showDialog<double>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final remaining = (dueAmount - receiveAmount).clamp(
            0,
            double.infinity,
          );

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: Row(
              children: const [
                Icon(Icons.payments_outlined),
                SizedBox(width: 10),
                Text("Receive Payment"),
              ],
            ),
            content: SizedBox(
              width: 430,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _paymentInfo("Total Amount", totalAmount),
                  const SizedBox(height: 10),

                  _paymentInfo("Already Paid", paidAmount),
                  const SizedBox(height: 10),

                  _paymentInfo(
                    "Remaining Due",
                    dueAmount,
                    color: Colors.red,
                    bold: true,
                  ),

                  const SizedBox(height: 25),

                  TextFormField(
                    controller: controller,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        receiveAmount = double.tryParse(value) ?? 0;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Receive Amount",
                      prefixText: "₹ ",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: remaining == 0
                          ? Colors.green.shade50
                          : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: remaining == 0 ? Colors.green : Colors.orange,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Remaining After Payment",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "₹${remaining.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: remaining == 0
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              FilledButton.icon(
                onPressed: receiveAmount <= 0 || receiveAmount > dueAmount
                    ? null
                    : () {
                        Navigator.pop(context, receiveAmount);
                      },
                icon: const Icon(Icons.check),
                label: const Text("Receive"),
              ),
            ],
          );
        },
      );
    },
  );
}

Widget _paymentInfo(
  String title,
  double value, {
  Color? color,
  bool bold = false,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      ),
      Text(
        "₹${value.toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 16,
          fontWeight: bold ? FontWeight.bold : FontWeight.w600,
          color: color,
        ),
      ),
    ],
  );
}
