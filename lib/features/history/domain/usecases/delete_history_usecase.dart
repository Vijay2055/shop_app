import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';

class DeleteHistoryUsecase {
  final SaleHistoryRepository _repository;
  const DeleteHistoryUsecase(this._repository);
  Future<Result<void>> call(String saleId) async {
    return _repository.deleteHistory(saleId: saleId);
  }
}
