import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/data/models/sales_history_mapper.dart';
import 'package:shop_app/features/history/datasource/sale_history_local_datasource.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_detail_entity.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_entity.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';

class SaleHistoryRepositoryImpl implements SaleHistoryRepository {
  final SaleHistoryLocalDataSource _localDataSource;

  SaleHistoryRepositoryImpl(this._localDataSource);

  @override
  Future<Result<List<SaleHistoryEntity>>> getSaleHistory({
    required int page,
    required int limit,
    String? search,
    String? paymentStatus,
  }) async {
    try {
      final rows = await _localDataSource.getSaleHistory(
        page: page,
        limit: limit,
        search: search,
        paymentStatus: paymentStatus,
      );

      final history = rows.map((e) => e.toEntity()).toList();

      return Success(history);
    } catch (e) {
      return FailureResult(DatabaseFailure("Unable to load sale history: $e"));
    }
  }

  @override
  Future<Result<int>> getSaleHistoryCount({String? search}) async {
    try {
      final count = await _localDataSource.getSaleHistoryCount(search: search);

      return Success(count);
    } catch (e) {
      return FailureResult(
        DatabaseFailure("Unable to get sale history count: $e"),
      );
    }
  }

  @override
  Future<Result<SaleHistoryDetailEntity?>> getSaleHistoryDetail(
    String saleId,
  ) async {
    try {
      final result = await _localDataSource.getSaleHistoryDetail(saleId);

      return Success(result);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> receivePayment({
    required String saleId,
    required double amount,
  }) async {
    try {
      await _localDataSource.receivePayment(saleId: saleId, amount: amount);

      return const Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteHistory({required String saleId}) async {
    try {
      await _localDataSource.deleteHistory(saleId: saleId);
      return Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }
}

final saleHistoryRepositoryProvider = Provider<SaleHistoryRepository>((ref) {
  return SaleHistoryRepositoryImpl(
    ref.watch(salseHisoryLocalDataSourcceProvider),
  );
});
