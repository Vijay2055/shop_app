import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/homepage/data/dashboardDataSoruce/dashboard_dataSource.dart';
import 'package:shop_app/features/homepage/data/mapper/dto_to_enity.dart';
import 'package:shop_app/features/homepage/data/mapper/revenue_point_mapper.dart';
import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';
import 'package:shop_app/features/homepage/domain/entity/revenue_point_enity.dart';
import 'package:shop_app/features/homepage/domain/repository/dashboard_summary_Repository.dart';

class DashboardRepositoryImpl extends DashboardSummaryRepository {
  final DashboardLocalDataSource _dataSource;

  DashboardRepositoryImpl(this._dataSource);

  @override
  Future<Result<DashboardSummaryEntity>> getSummary() async {
    try {
      final result = await _dataSource.getDashboardSummary();
      return Success(result.toEntity());
    } catch (e) {
      debugPrint("Can't load summary due to :: $e");
      return FailureResult(DatabaseFailure("Failed to load summary"));
    }
  }

  @override
  Future<Result<List<RevenuePointEntity>>> getRevenueGraph({
    int days = 7,
  }) async {
    try {
      final result = await _dataSource.getRevenueGraph(days: days);
      if (result.isEmpty) {
        return FailureResult(DatabaseFailure("No Sales found"));
      }
      return Success(result.map((item) => item.toEntity()).toList());
    } catch (e) {
      debugPrint("Can't load revenue overveiw due to :: $e");
      return FailureResult(DatabaseFailure("Failed to load revenue"));
    }
  }
}

final dashboardRepoProvider = Provider<DashboardSummaryRepository>((ref) {
  return DashboardRepositoryImpl(ref.watch(dashboardLocalDataSourceProvider));
});
