import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_detail_entity.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';

class GetSaleHistoryDetailUseCase {
  final SaleHistoryRepository repository;

  GetSaleHistoryDetailUseCase(this.repository);

  Future<Result<SaleHistoryDetailEntity?>> call(
    String saleId,
  ) {
    return repository.getSaleHistoryDetail(saleId);
  }
}