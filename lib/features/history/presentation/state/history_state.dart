import 'package:shop_app/features/history/data/models/history_model.dart';

class HistoryState {
  final List<HistoryModel> histories;
  final bool isLoading;
  final String? error;

  // 🔄 Pagination
  final int currentPage;
  final bool hasMore;

  HistoryState({
    this.error,
    this.isLoading = false,
    this.histories = const [],
    this.currentPage = 1,
    this.hasMore = true,
  });

  HistoryState copyWith({
    String? error,
    List<HistoryModel>? histories,
    bool? isLoading,
    int? currentPage,
    bool? hasMore,
  }) {
    return HistoryState(
      error: error ?? this.error,
      histories: histories ?? this.histories,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  // 🔎 Search by date range
  List<HistoryModel> filterByDateRange(DateTime start, DateTime end) {
    return histories.where((h) =>
        h.date.isAfter(start) && h.date.isBefore(end)).toList();
  }

  // 💰 Total sold
  //  double get totalSold {
  //   return histories.fold(
  //       0.0, (sum, h) => sum + h.products.fold(0.0, (sum2,next)=>sum2+(next.priceAtPurchase*next.quantity)));
  // }

  // // 📦 Total items purchased
  // int get totalItems {
  //   return histories.fold(0, (sum, h) => sum + h.products.fold(0, (sum2,next)=>sum2+next.quantity));
  // }
}
