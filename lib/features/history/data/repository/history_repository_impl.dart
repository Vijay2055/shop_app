import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/data/models/history_detail_model.dart';

import 'package:shop_app/features/history/data/models/history_model.dart';
import 'package:shop_app/features/history/datasource/history_data.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDatasource datasource;

  HistoryRepositoryImpl(this.datasource);

  // =====================================================
  // CREATE BILL
  // =====================================================
  @override
  Future<Result<String>> createBill({
    required HistoryModel history,
    required List<PurchaseItem> item,
  }) async {
    try {
      final result = await datasource.createBill(history: history, items: item);
       
       if(result.data == null) {
        throw Exception("Failed to get bill id");
       }

      if (result.isSuccess && result.data != null) {
        return Result.success(result.data);
      }

      return Result.failure(result.error!);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // GET ALL HISTORY
  // =====================================================
  @override
  Future<Result<List<HistoryModel>>> getAllHistory() async {
    try {
      final result = await datasource.getAllHistory();

      if (result.isSuccess) {
        // convert DB model → domain model
        final data = result.data!
            .map((e) => HistoryModel.fromDrift(e))
            .toList();

        return Result.success(data);
      }

      return Result.failure(result.error!);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // GET HISTORY DETAIL
  // =====================================================
  @override
  Future<Result<HistoryDetailModel>> getHistoryDetail(String historyId) async {
    try {
      final result = await datasource.getBillDetail(historyId);

      if (result.isSuccess) {
        final historyDetail = result.data;
        final mappedHistoryDetail = HistoryDetailModel(
          id: historyDetail!.history.id,
          date: historyDetail.history.createdAt,
          totalAmount: historyDetail.history.total,
          status: historyDetail.history.status,
          items: historyDetail.items
              .map(
                (e) => PurchaseItem(
                  productId: e.productId,
                  quantity: e.quantity,
                  priceAtPurchase: e.priceAtPurchase,
                  productName: e.productName,
                ),
              )
              .toList(),
        );
        return Result.success(mappedHistoryDetail);
      }

      return Result.failure(result.error!);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // DELETE HISTORY
  // =====================================================
  @override
  Future<Result<void>> deleteHistory(String historyId) async {
    try {
      final result = await datasource.deleteBill(historyId);

      if (result.isSuccess) {
        return Result.success(null);
      }

      return Result.failure(result.error!);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // UPDATE UDHAR
  // =====================================================
  @override
  Future<Result<void>> updateUdhar({
    required String historyId,
    required int? udharId,
  }) async {
    try {
      final result = await datasource.updateUdhar(
        billId: historyId,
        udharId: udharId,
      );

      if (result.isSuccess) {
        return Result.success(null);
      }

      return Result.failure(result.error!);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }
}
