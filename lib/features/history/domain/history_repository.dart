import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_detail_entity.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_entity.dart';

abstract interface class SaleHistoryRepository {
  Future<Result<List<SaleHistoryEntity>>> getSaleHistory({
    required int page,
    required int limit,
    String? search,
    String? paymentStatus,
    
  });

  Future<Result<int>> getSaleHistoryCount({String? search});
  Future<Result<SaleHistoryDetailEntity?>> getSaleHistoryDetail(String saleId);

  Future<Result<void>> receivePayment({
    required String saleId,
    required double amount,
  });
}
