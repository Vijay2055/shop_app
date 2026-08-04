import 'package:shop_app/features/homepage/domain/entity/dashboard_summary_entity.dart';

class DashboardSummaryState {
  final bool isLoading;
  final String? error;
  final DashboardSummaryEntity? entity;

  const DashboardSummaryState({
    this.isLoading = false,
    this.entity,
    this.error,
  });

  DashboardSummaryState copyWith({
    bool? isLoading,
    String? error,
    DashboardSummaryEntity? entity,
  }) {
    return DashboardSummaryState(
      entity: entity ?? this.entity,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
