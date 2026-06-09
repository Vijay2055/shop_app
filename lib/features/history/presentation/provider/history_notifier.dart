import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';
import 'package:shop_app/features/history/data/models/history_detail_model.dart';
import 'package:shop_app/features/history/data/models/history_model.dart';
import 'package:shop_app/features/history/datasource/history_data.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';
import 'package:shop_app/features/history/presentation/provider/histroy_repository_provider.dart';
import 'package:shop_app/features/history/presentation/state/history_state.dart';

class HistoryNotifier extends AsyncNotifier<HistoryState> {
  late final HistoryRepository _repository;
  @override
  Future<HistoryState> build() async {
    _repository = ref.read(historyRepositoryProvider);
    // ✅ only return initial state
    final result = await _repository.getAllHistory();
    if (result.isSuccess) {
      return HistoryState(histories: result.data ?? []);
    }
    return HistoryState(error: result.error.toString());
  }

  /// =====================================================
  /// CREATE BILL
  /// =====================================================
  Future<String> createBill({
    required double total,
    required List<CartItem> items,
    int? udharId,
    String? status,
  }) async {
    state = const AsyncLoading();
    final purchaseItems = items
        .map(
          (e) => PurchaseItem(
            productId: e.productId,
            quantity: e.quantity,
            priceAtPurchase: e.price,
            productName: e.name,
          ),
        )
        .toList();
    final history = HistoryModel(
      id: '',
      date: DateTime.now(),
      total: total,
      udharId: udharId,
      status: status,
    );

    final result = await _repository.createBill(
      history: history,
      item: purchaseItems,
    );

    if (result.isSuccess) {
      await refreshHistory();
      return result.data!;
    } else {
      print("Error creating bill: ${result.error?.message.toString()}");
      state = AsyncError(result.error!, StackTrace.current);
      throw Exception("Failed to create bill");
    }
  }

  /// =====================================================
  /// REFRESH HISTORY
  /// =====================================================
  Future<void> refreshHistory() async {
    final result = await _repository.getAllHistory();

    if (result.isSuccess) {
      state = AsyncData(HistoryState(histories: result.data ?? []));
    } else {
      state = AsyncError(result.error!, StackTrace.current);
    }
  }

  /// =====================================================
  /// GET DETAIL
  /// =====================================================
  Future<HistoryDetailModel?> getHistoryDetail(String historyId) async {
    final result = await _repository.getHistoryDetail(historyId);

    if (result.isSuccess) {
      return result.data;
    }

    return null;
  }

  /// =====================================================
  /// DELETE HISTORY
  /// =====================================================
  Future<void> deleteHistory(String historyId) async {
    final result = await _repository.deleteHistory(historyId);

    if (result.isSuccess) {
      await refreshHistory();
    } else {
      state = AsyncError(result.error!, StackTrace.current);
    }
  }

  /// =====================================================
  /// UPDATE UDHAR
  /// =====================================================
  Future<void> updateUdhar({
    required String historyId,
    required int? udharId,
  }) async {
    final result = await _repository.updateUdhar(
      historyId: historyId,
      udharId: udharId,
    );

    if (result.isSuccess) {
      await refreshHistory();
    } else {
      state = AsyncError(result.error!, StackTrace.current);
    }
  }
}

final historyProvider = AsyncNotifierProvider<HistoryNotifier, HistoryState>(
  HistoryNotifier.new,
);
