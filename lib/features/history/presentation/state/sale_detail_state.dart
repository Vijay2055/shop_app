import 'package:shop_app/features/history/domain/entity/sale_history_detail_entity.dart';

class SaleDetailState {
  final bool isLoading;
  final SaleHistoryDetailEntity? sale;
  final String error;

  const SaleDetailState({this.isLoading = false, this.sale, this.error = ''});

  SaleDetailState copyWith({
    bool? isLoading,
    SaleHistoryDetailEntity? sale,
    String? error,
  }) {
    return SaleDetailState(
      isLoading: isLoading ?? this.isLoading,
      sale: sale ?? this.sale,
      error: error ?? this.error,
    );
  }
}
