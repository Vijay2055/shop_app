import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/domain/history_repository.dart';

class ReceivePaymentUseCase {
  final SaleHistoryRepository _repository;

  const ReceivePaymentUseCase(this._repository);

  Future<Result<void>> call({
    required String saleId,
    required double amount,
  }) async {
    if (amount <= 0) {
      return FailureResult(
        DatabaseFailure("Please enter a valid payment amount."),
      );
    }

    return _repository.receivePayment(saleId: saleId, amount: amount);
  }
}
