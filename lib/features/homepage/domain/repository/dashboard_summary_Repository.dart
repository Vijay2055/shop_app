import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';
import 'package:shop_app/features/homepage/domain/entity/revenue_point_enity.dart';

abstract class DashboardSummaryRepository {
  Future<Result<DashboardSummaryEntity>> getSummary();
  Future<Result<List<RevenuePointEntity>>> getRevenueGraph({
    int days = 7,
  });
}