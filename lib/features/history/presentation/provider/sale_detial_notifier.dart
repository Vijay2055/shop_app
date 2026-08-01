import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/usecases/usecaseProvider/usecase_provider.dart';
import 'package:shop_app/features/history/presentation/state/sale_detail_state.dart';

class SaleDetailNotifier extends Notifier<SaleDetailState> {
  @override
  SaleDetailState build() => const SaleDetailState();

  Future<void> load(String saleId) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await ref.read(getSaleHistoryDetailUseCaseProvider)(saleId);

    switch (result) {
      case Success(:final data):
        state = state.copyWith(isLoading: false, sale: data);

      case FailureResult(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }

  Future<void> receivePayment({
    required String saleId,
    required double amount,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await ref.read(receivePaymentUseCaseProvider)(
      saleId: saleId,
      amount: amount,
    );

    switch (result) {
      case Success():
        await load(saleId);

      case FailureResult(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }
}

final saleDetailProvider =
    NotifierProvider.autoDispose<SaleDetailNotifier, SaleDetailState>(
      SaleDetailNotifier.new,
    );
