import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';
import 'package:shop_app/features/homepage/presentation/providers/usecase_provider.dart';
import 'package:shop_app/features/homepage/presentation/states/dashboard_summary_state.dart';

class DashboardSummaryNotifier extends Notifier<DashboardSummaryState> {
  @override
  DashboardSummaryState build() {
    Future.microtask(() {
      _fetchSummary();
    });
    return DashboardSummaryState();
  }

  Future<void> _fetchSummary() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await ref.read(dashboardSummaryUsecaseProvider)();
    switch (result) {
      case Success<DashboardSummaryEntity>(:final data):
        state = state.copyWith(isLoading: false, error: null, entity: data);
      case FailureResult<DashboardSummaryEntity>(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }
}

final dashboardSummaryProvider =
    NotifierProvider.autoDispose<
      DashboardSummaryNotifier,
      DashboardSummaryState
    >(DashboardSummaryNotifier.new);
