import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/features/history/data/models/history_model.dart';
import 'package:shop_app/features/history/presentation/provider/history_notifier.dart';
import 'package:shop_app/features/history/presentation/screens/history_detail.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  String searchQuery = "";
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(historyProvider);

    final currency = NumberFormat.currency(symbol: "Rs ");
    final dateFormat = DateFormat("dd MMM yyyy");

    return historyAsync.when(
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
                  ref.read(historyProvider.notifier).refreshHistory();
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),

      data: (provider) {
        /// 🔍 FILTER LOGIC
        final filteredHistories = provider.histories.where((history) {
          final query = searchQuery.toLowerCase();

          final matchId = history.id.toLowerCase().contains(query);

          // final matchProduct = history.products.any(
          //   (p) => p.productName.toLowerCase().contains(query),
          // );

          return matchId;
        }).toList();

        return Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order History",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  /// 🔍 SEARCH FIELD
                  TextField(
                    controller: _controller,
                    onChanged: (value) {
                      setState(() => searchQuery = value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search order or product...",
                      prefixIcon: const Icon(Icons.search),

                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _controller.clear();
                                setState(() => searchQuery = "");
                              },
                            )
                          : null,

                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// 📦 LIST / EMPTY STATE
                  Expanded(
                    child: filteredHistories.isEmpty
                        ? _EmptyState()
                        : ListView.separated(
                            padding: const EdgeInsets.all(20),
                            itemCount: filteredHistories.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 14),

                            itemBuilder: (context, index) {
                              final history = filteredHistories[index];

                              return _HistoryCard(
                                history: history,
                                currency: currency,
                                dateFormat: dateFormat,
                                onTap: () {
                                 
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          HistoryDetail(historyId: history.id),
                                    ),
                                  );
                                },
                              );
                            },
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
}

/// 🧾 HISTORY CARD (UNCHANGED DESIGN)
class _HistoryCard extends StatefulWidget {
  final HistoryModel history;
  final NumberFormat currency;
  final DateFormat dateFormat;
  final VoidCallback onTap;

  const _HistoryCard({
    required this.history,
    required this.currency,
    required this.dateFormat,
    required this.onTap,
  });

  @override
  State<_HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<_HistoryCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(isHovered ? 1.01 : 1.0),

          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isHovered ? Colors.grey[50] : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: isHovered ? 16 : 8,
                color: Colors.black.withOpacity(isHovered ? 0.15 : 0.08),
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(
              color: isHovered
                  ? Colors.blue.withOpacity(0.3)
                  : Colors.transparent,
            ),
          ),

          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isHovered
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.receipt_long, color: Colors.blue),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #${widget.history.id}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${widget.dateFormat.format(widget.history.date)} • items",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.currency.format(widget.history.total),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(
                      isHovered ? 4 : 0,
                      0,
                      0,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
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

/// ❌ EMPTY STATE
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No matching orders found",
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}
