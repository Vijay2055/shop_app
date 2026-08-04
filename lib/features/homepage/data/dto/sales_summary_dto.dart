import 'package:shop_app/features/homepage/data/dto/topSellingDto.dart';
import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';

class DashboardSummaryDto extends DashboardSummaryEntity {
  const DashboardSummaryDto({
    required super.totalSales,
    required super.totalProfit,
    required super.totalDue,
    required super.totalItemsSold,
    required super.totalInvoices,
    required super.totalCustomers,
    required super.totalProducts,
    required super.totalVariants,
    required super.lowStockProducts,
    required super.totalCostPrice,
    required super.totalPurchaseAmt,
    required super.totalVatCp,

    required List<TopSellingDto> super.topSellingProducts,
  });
}
