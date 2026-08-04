import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/homepage/data/repository/dashboard_repository_impl.dart';
import 'package:shop_app/features/homepage/domain/usecase/dashbaoard_summary_usecase.dart';
import 'package:shop_app/features/homepage/domain/usecase/dashboard_revenue_usecase.dart';

final dashboardSummaryUsecaseProvider = Provider<DashbaoardSummaryUsecase>((
  ref,
) {
  return DashbaoardSummaryUsecase(ref.watch(dashboardRepoProvider));
});

final dashboardRevenueUsecaseProvider = Provider<DashbaoardRevenueUsecase>((
  ref,
) {
  return DashbaoardRevenueUsecase(ref.watch(dashboardRepoProvider));
});
