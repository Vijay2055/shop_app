import 'package:shop_app/features/history/domain/entity/sale_history_entity.dart';
import 'package:shop_app/features/history/presentation/enum/menu_enum.dart';

class SaleHistoryState {
  final List<SaleHistoryEntity> sales;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final String message;

  final int page;
  final int totalCount;
  final bool hasMore;

  final String search;
  final PaymentFilter paymentFilter;

  const SaleHistoryState({
    this.sales = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.page = 1,
    this.totalCount = 0,
    this.hasMore = true,
    this.message = '',
    this.search = '',
    this.paymentFilter = PaymentFilter.all,
  });

  SaleHistoryState copyWith({
    List<SaleHistoryEntity>? sales,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? page,
    int? totalCount,
    bool? hasMore,
    String? search,
    PaymentFilter? paymentFilter,
    String? message,
  }) {
    return SaleHistoryState(
      sales: sales ?? this.sales,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      page: page ?? this.page,
      totalCount: totalCount ?? this.totalCount,
      hasMore: hasMore ?? this.hasMore,
      search: search ?? this.search,
      paymentFilter: paymentFilter ?? this.paymentFilter,
      message: message ?? this.message,
    );
  }
}
