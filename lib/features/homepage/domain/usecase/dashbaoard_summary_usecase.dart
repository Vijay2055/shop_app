import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';
import 'package:shop_app/features/homepage/domain/repository/dashboard_summary_Repository.dart';

class DashbaoardSummaryUsecase {
  final DashboardSummaryRepository _repository;
  const DashbaoardSummaryUsecase(this._repository);

  Future<Result<DashboardSummaryEntity>> call() {
    return _repository.getSummary();
  }
}
