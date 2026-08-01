import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/history/data/repository/history_repository_impl.dart';
import 'package:shop_app/features/history/domain/usecases/getSaleHistoryCountUsecase.dart';
import 'package:shop_app/features/history/domain/usecases/get_sale_history_usecase.dart';
import 'package:shop_app/features/history/domain/usecases/getsaleHistoryUsecase.dart';
import 'package:shop_app/features/history/domain/usecases/receive_payment_usecase.dart';

final getSaleHistoryUseCaseProvider = Provider<GetSaleHistoryUseCase>((ref) {
  return GetSaleHistoryUseCase(ref.watch(saleHistoryRepositoryProvider));
});

final getSaleHistoryCountUseCaseProvider = Provider<GetSaleHistoryCountUseCase>(
  (ref) {
    return GetSaleHistoryCountUseCase(ref.watch(saleHistoryRepositoryProvider));
  },
);

final getSaleHistoryDetailUseCaseProvider =
    Provider<GetSaleHistoryDetailUseCase>((ref) {
      return GetSaleHistoryDetailUseCase(
        ref.watch(saleHistoryRepositoryProvider),
      );
    });

final receivePaymentUseCaseProvider = Provider(
  (ref) => ReceivePaymentUseCase(ref.read(saleHistoryRepositoryProvider)),
);
