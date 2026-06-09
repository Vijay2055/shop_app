import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/data/models/history_detail_model.dart';
import 'package:shop_app/features/history/data/models/history_model.dart';
import 'package:shop_app/features/history/datasource/history_data.dart';


abstract class HistoryRepository {
  Future<Result<String>> createBill({
    required HistoryModel history,
    required List<PurchaseItem> item,
  });

  Future<Result<List<HistoryModel>>> getAllHistory();

  Future<Result<HistoryDetailModel>> getHistoryDetail(String historyId);

  Future<Result<void>> deleteHistory(String historyId);

  Future<Result<void>> updateUdhar({
    required String historyId,
    required int? udharId,
  });
}