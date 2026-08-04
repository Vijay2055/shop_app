import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/homepage/presentation/providers/usecase_provider.dart';
import 'package:shop_app/features/homepage/presentation/states/dashboard_revenue_state.dart';

class DashboardRevenueNotifier extends Notifier<DashboardRevenueState> {
  @override
  DashboardRevenueState build() {
    Future.microtask(() {
      loadRevenue();
    });
    return const DashboardRevenueState();
  }

  Future<void> loadRevenue({int days = 7}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await ref
        .read(dashboardRevenueUsecaseProvider)
        .call(days: days);

    switch (result) {
      case Success(data: final revenue):
        state = state.copyWith(isLoading: false, revenue: revenue);

      case FailureResult(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }
}

final dashboardRevenueNotifierProvider =
    NotifierProvider.autoDispose<
      DashboardRevenueNotifier,
      DashboardRevenueState
    >(DashboardRevenueNotifier.new);
