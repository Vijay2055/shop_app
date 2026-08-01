import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';


class GetSaleHistoryCountUseCase {
  final SaleHistoryRepository repository;

  GetSaleHistoryCountUseCase(this.repository);

  Future<Result<int>> call({
    String? search,
  }) {
    return repository.getSaleHistoryCount(
      search: search,
    );
  }
}