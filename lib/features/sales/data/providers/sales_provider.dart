import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/customer/data/repository/customer_repository_impl.dart';
import 'package:shop_app/features/sales/domain/repositoy/sale_reposioty.dart';
import 'package:shop_app/features/sales/domain/usecase/complete_sale_usecase.dart';

final completeSaleUseCaseProvider = Provider<CompleteSaleUseCase>((ref) {
  return CompleteSaleUseCase(
    ref.watch(saleRepositoryProvider),
    ref.watch(customerRepositoryProvider),
  );
});
