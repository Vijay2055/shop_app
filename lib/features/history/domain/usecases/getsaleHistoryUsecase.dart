import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_entity.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';
import 'package:shop_app/features/history/presentation/enum/menu_enum.dart';

class GetSaleHistoryUseCase {
  final SaleHistoryRepository repository;

  GetSaleHistoryUseCase(this.repository);

  Future<Result<List<SaleHistoryEntity>>> call({
    required int page,
    required int limit,
    String? search,
    PaymentFilter? paymentStatus,
  }) {
    return repository.getSaleHistory(
      page: page,
      limit: limit,
      search: search,
      paymentStatus: paymentStatus?.name ?? PaymentFilter.all.name,
    );
  }
}
