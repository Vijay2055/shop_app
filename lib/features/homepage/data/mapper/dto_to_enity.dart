import 'package:shop_app/features/homepage/data/dto/sales_summary_dto.dart';
import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';

extension DashboardSummaryDtoX on DashboardSummaryDto {
  DashboardSummaryEntity toEntity() {
    return DashboardSummaryEntity(
      totalSales: totalSales,
      totalProfit: totalProfit,
      totalDue: totalDue,
      totalItemsSold: totalItemsSold,
      totalInvoices: totalInvoices,
      totalCustomers: totalCustomers,
      totalProducts: totalProducts,
      totalVariants: totalVariants,
      lowStockProducts: lowStockProducts,
      topSellingProducts: topSellingProducts,
      totalCostPrice: totalCostPrice,
      totalPurchaseAmt: totalPurchaseAmt,
      totalVatCp: totalVatCp,
    );
  }
}
