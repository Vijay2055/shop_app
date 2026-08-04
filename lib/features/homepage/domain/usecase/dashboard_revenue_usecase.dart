import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/homepage/domain/entity/revenue_point_enity.dart';
import 'package:shop_app/features/homepage/domain/repository/dashboard_summary_Repository.dart';

class DashbaoardRevenueUsecase {
  final DashboardSummaryRepository _repository;
  const DashbaoardRevenueUsecase(this._repository);

  Future<Result<List<RevenuePointEntity>>> call({
    int days=7
  }) {
    return _repository.getRevenueGraph(days: days);
  }
}
