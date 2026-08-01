import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/customer/data/repository/customer_repository_impl.dart';
import 'package:shop_app/features/customer/domain/usecase/insert_customer_usecase.dart';

final insertCustomerProviderUsecase = Provider<InsertCustomerUsecase>((ref) {
  return InsertCustomerUsecase(ref.watch(customerRepositoryProvider));
});
