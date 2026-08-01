import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/usecases/usecaseProvider/usecase_provider.dart';
import 'package:shop_app/features/history/presentation/enum/menu_enum.dart';

import 'package:shop_app/features/history/presentation/state/sale_hisory_state.dart';

class SaleHistoryNotifier extends Notifier<SaleHistoryState> {
  static const int _limit = 20;

  @override
  SaleHistoryState build() {
    Future.microtask(loadHistory);
    return const SaleHistoryState();
  }

  Future<void> loadHistory() async {
    state = state.copyWith(isLoading: true, error: null, page: 1);

    final countResult = await ref.read(getSaleHistoryCountUseCaseProvider)(
      search: state.search.isEmpty ? null : state.search,
    );

    final historyResult = await ref.read(getSaleHistoryUseCaseProvider)(
      page: 1,
      limit: _limit,
      search: state.search.isEmpty ? null : state.search,
    );

    switch (countResult) {
      case Success<int>(:final data):
        switch (historyResult) {
          case Success(:final data):
            state = state.copyWith(
              sales: data,
              totalCount: countResult.data,
              page: 1,
              hasMore: data.length < countResult.data,
              isLoading: false,
            );

          case FailureResult(:final failure):
            debugPrint(failure.message);
            state = state.copyWith(isLoading: false, error: failure.message);
        }

      case FailureResult(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore) return;

    state = state.copyWith(isLoadingMore: true);

    final nextPage = state.page + 1;

    final result = await ref.read(getSaleHistoryUseCaseProvider)(
      page: nextPage,
      limit: _limit,
      search: state.search.isEmpty ? null : state.search,
    );

    switch (result) {
      case Success(:final data):
        final allSales = [...state.sales, ...data];

        state = state.copyWith(
          sales: allSales,
          page: nextPage,
          isLoadingMore: false,
          hasMore: allSales.length < state.totalCount,
        );

      case FailureResult(:final failure):
        state = state.copyWith(isLoadingMore: false, error: failure.message);
    }
  }

  Future<void> search(String value) async {
    state = state.copyWith(search: value, page: 1);

    await loadHistory();
  }

  Future<void> refresh() async {
    await loadHistory();
  }

  Future<void> loadPage(int page) async {
    state = state.copyWith(isLoading: true, page: page, error: null);

    final result = await ref.read(getSaleHistoryUseCaseProvider)(
      page: page,
      limit: _limit,
      search: state.search.isEmpty ? null : state.search,
      paymentStatus: state.paymentFilter,
    );

    switch (result) {
      case Success(:final data):
        state = state.copyWith(sales: data, page: page, isLoading: false);

      case FailureResult(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }

  void filterByPayment(PaymentFilter filter) {
    state = state.copyWith(paymentFilter: filter);
    loadPage(1);
  }
}

final saleHistoryProvider =
    NotifierProvider.autoDispose<SaleHistoryNotifier, SaleHistoryState>(
      SaleHistoryNotifier.new,
    );
