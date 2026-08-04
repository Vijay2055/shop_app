import 'package:shop_app/features/homepage/domain/entity/revenue_point_enity.dart';

class DashboardRevenueState {
  final bool isLoading;
  final List<RevenuePointEntity> revenue;
  final String? error;

  const DashboardRevenueState({
    this.isLoading = false,
    this.revenue = const [],
    this.error,
  });

  DashboardRevenueState copyWith({
    bool? isLoading,
    List<RevenuePointEntity>? revenue,
    String? error,
    bool clearError = false,
  }) {
    return DashboardRevenueState(
      isLoading: isLoading ?? this.isLoading,
      revenue: revenue ?? this.revenue,
      error: clearError ? null : (error ?? this.error),
    );
  }
}