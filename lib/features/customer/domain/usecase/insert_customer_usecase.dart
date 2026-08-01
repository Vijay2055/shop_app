import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';
import 'package:shop_app/features/customer/domain/repository/customer_reposioty.dart';

class InsertCustomerUsecase {
  final CustomerRepository _repository;
  const InsertCustomerUsecase(this._repository);
  Future<Result<void>> call(CustomerEntity entity) {
    return _repository.insertCustomer(entity);
  }
}
