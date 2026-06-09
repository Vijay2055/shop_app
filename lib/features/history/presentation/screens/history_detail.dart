import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/features/history/presentation/provider/history_detail_provider.dart';

class HistoryDetail extends ConsumerWidget {
  const HistoryDetail({super.key, required this.historyId});

  // final HistoryModel historyModel;
  final String historyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(historyDetailProvider(historyId));
    final currency = NumberFormat.currency(symbol: "Rs ");
    final dateFormat = DateFormat("dd MMM yyyy, hh:mm a");

    return detailAsync.when(
      loading: () => Container(
        color: Colors.grey[100],
        child: const Center(child: CircularProgressIndicator()),
      ),

      error: (error, stackTrace) => Container(
        color: Colors.grey[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 12),
              Text(error.toString(), style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(historyDetailProvider(historyId));
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),

      data: (historyModel) {
        return Container(
          padding: const EdgeInsets.all(24),
          color: Colors.grey[100],
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  /// 🔙 Back + Title Row (PRO VERSION)
                  Row(
                    children: [
                      _BackButton(),
                      const SizedBox(width: 14),
                      const Text(
                        "Order Details",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Top Info Cards (Row for desktop)
                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          title: "Date",
                          value: dateFormat.format(historyModel.date),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _infoCard(
                          title: "Order ID",
                          value: historyModel.id,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _infoCard(
                          title: "Total",
                          value: currency.format(historyModel.totalAmount),
                          valueColor: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// Items Table Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// Table Header
                          Row(
                            children: const [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Product",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Qty",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Price",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Total",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                          const Divider(height: 30),

                          /// Items List
                          Expanded(
                            child: ListView.separated(
                              itemCount: historyModel.items.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final item = historyModel.items[index];

                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[50],
                                  ),
                                  child: Row(
                                    children: [
                                      /// Product Name
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          item.productName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),

                                      /// Quantity
                                      Expanded(child: Text("${item.quantity}")),

                                      /// Price
                                      Expanded(
                                        child: Text(
                                          currency.format(item.priceAtPurchase),
                                        ),
                                      ),

                                      /// Total
                                      Expanded(
                                        child: Text(
                                          currency.format(
                                            item.priceAtPurchase *
                                                item.quantity,
                                          ),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          const Divider(),

                          /// Bottom Total Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Grand Total",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                currency.format(historyModel.totalAmount),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _infoCard({
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(blurRadius: 8, color: Colors.black12, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatefulWidget {
  @override
  State<_BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<_BackButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      child: GestureDetector(
        onTap: () => Navigator.pop(context),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),

            /// Glass + subtle gradient feel
            gradient: LinearGradient(
              colors: isHovered
                  ? [
                      Colors.blue.withOpacity(0.15),
                      Colors.blue.withOpacity(0.05),
                    ]
                  : [Colors.white, Colors.grey.shade100],
            ),

            boxShadow: [
              BoxShadow(
                blurRadius: isHovered ? 12 : 6,
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 4),
              ),
            ],

            border: Border.all(
              color: isHovered
                  ? Colors.blue.withOpacity(0.4)
                  : Colors.grey.withOpacity(0.2),
            ),
          ),

          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(isHovered ? -2 : 0, 0, 0),
                child: const Icon(Icons.arrow_back_ios_new, size: 18),
              ),
              const SizedBox(width: 6),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isHovered ? Colors.blue : Colors.black,
                ),
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
