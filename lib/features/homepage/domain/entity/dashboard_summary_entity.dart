import 'package:shop_app/features/homepage/domain/entity/top_selling_entity.dart';

class DashboardSummaryEntity {
  final double totalSales;
  final double totalProfit;
  final double totalDue;
  final double totalCostPrice;
  final double totalVatCp;
  final double totalPurchaseAmt;

  final int totalItemsSold;
  final int totalInvoices;
  final int totalCustomers;

  final int totalProducts;
  final int totalVariants;
  final int lowStockProducts;

  final List<TopSellingEntity> topSellingProducts;

  const DashboardSummaryEntity({
    required this.totalSales,
    required this.totalProfit,
    required this.totalDue,
    required this.totalItemsSold,
    required this.totalInvoices,
    required this.totalCustomers,
    required this.totalProducts,
    required this.totalVariants,
    required this.lowStockProducts,
    required this.topSellingProducts,
    required this.totalCostPrice,
    required this.totalPurchaseAmt,
    required this.totalVatCp
  });
}
