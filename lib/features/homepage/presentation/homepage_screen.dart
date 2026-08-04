import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/homepage/presentation/providers/dashboard_revenue_provider.dart';
import 'package:shop_app/features/homepage/presentation/providers/dashboard_summary_provider.dart';

class HomepageScreen extends ConsumerWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryState = ref.watch(dashboardSummaryProvider);
    final revenueState = ref.watch(dashboardRevenueNotifierProvider);
    final maxRevenue = revenueState.revenue.fold<double>(
      0,
      (max, e) => e.revenue > max ? e.revenue : max,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: summaryState.entity == null
            ? Text("Nothing to show")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  const Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),
                  Text(
                    "Welcome back 👋 here’s your store performance",
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 24),

                  /// TOP STATS
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          title: "Revenue",
                          value: "Rs ${summaryState.entity!.totalSales}",
                          icon: Icons.payments,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: "Due Amount",
                          value: "Rs ${summaryState.entity!.totalDue}",
                          icon: Icons.shopping_cart,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: "Products",
                          value: '${summaryState.entity!.totalVariants}',
                          icon: Icons.inventory_2,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: "Low Stock",
                          value: '${summaryState.entity!.lowStockProducts}',
                          icon: Icons.warning,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          title: summaryState.entity!.totalProfit >= 0
                              ? "Profit"
                              : "Loss",
                          value:
                              "Rs ${summaryState.entity!.totalProfit >= 0 ? summaryState.entity!.totalProfit : summaryState.entity!.totalProfit.abs()}",
                          icon: summaryState.entity!.totalProfit >= 0
                              ? Icons.trending_up
                              : Icons.trending_down,
                          color: summaryState.entity!.totalProfit >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: "Total Cost",
                          value: "Rs ${summaryState.entity!.totalCostPrice}",
                          icon: Icons.payments_outlined,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: "VAT Amount",
                          value: "Rs ${summaryState.entity!.totalVatCp}",
                          icon: Icons.receipt_long,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: "Total Purchase",
                          value: "Rs ${summaryState.entity!.totalPurchaseAmt}",
                          icon: Icons.shopping_bag,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// MAIN GRID
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 300,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(blurRadius: 10, color: Colors.black12),
                            ],
                          ),
                          child: LineChart(
                            LineChartData(
                              minX: 0,
                              maxX: (revenueState.revenue.length - 1)
                                  .toDouble(),
                              minY: 0,
                              maxY: maxRevenue == 0 ? 100 : maxRevenue * 1.2,

                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                horizontalInterval: maxRevenue == 0
                                    ? 20
                                    : maxRevenue / 5,
                              ),

                              borderData: FlBorderData(
                                show: true,
                                border: Border(
                                  left: BorderSide(color: Colors.grey.shade300),
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),

                              titlesData: FlTitlesData(
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),

                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 50,
                                    interval: maxRevenue == 0
                                        ? 20
                                        : maxRevenue / 5,
                                    getTitlesWidget: (value, meta) {
                                      String text;

                                      if (value >= 100000) {
                                        text =
                                            "₹${(value / 100000).toStringAsFixed(1)}L";
                                      } else if (value >= 1000) {
                                        text =
                                            "₹${(value / 1000).toStringAsFixed(0)}K";
                                      } else {
                                        text = "₹${value.toInt()}";
                                      }

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 6,
                                        ),
                                        child: Text(
                                          text,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    reservedSize: 32,
                                    getTitlesWidget: (value, meta) {
                                      final index = value.toInt();

                                      if (index < 0 ||
                                          index >=
                                              revenueState.revenue.length) {
                                        return const SizedBox();
                                      }

                                      final date =
                                          revenueState.revenue[index].date;

                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          "${date.day}/${date.month}",
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              lineBarsData: [
                                LineChartBarData(
                                  spots: List.generate(
                                    revenueState.revenue.length,
                                    (i) => FlSpot(
                                      i.toDouble(),
                                      revenueState.revenue[i].revenue,
                                    ),
                                  ),
                                  isCurved: true,
                                  barWidth: 3,
                                  dotData: const FlDotData(show: true),
                                  belowBarData: BarAreaData(show: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// RIGHT SIDE (NOTIFICATIONS)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(blurRadius: 10, color: Colors.black12),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Top Selling Products",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              ...summaryState.entity!.topSellingProducts
                                  .map(
                                    (item) => _row(
                                      item.productName,
                                      item.quantitySold.toString(),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(height: 24),

                  // Container(
                  //   padding: const EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(16),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 10, color: Colors.black12),
                  //     ],
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         "Notifications",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),

                  //       const SizedBox(height: 16),

                  //       _notif("Low stock: Milk", Colors.red),
                  //       _notif("New order received", Colors.green),
                  //       _notif("Product added", Colors.blue),
                  //       _notif("Order #1024 completed", Colors.grey),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }

  /// 📦 TOP PRODUCTS ROW
  static Widget _row(String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  /// 🔔 NOTIFICATION ITEM
  static Widget _notif(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(Icons.circle, size: 10, color: color),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

/// 🔥 STAT CARD
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
