import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';

abstract class CustomerRepository{
  Future<Result<List<CustomerEntity>>> getAllCustomers();

  Future<Result<CustomerEntity>> getCustomerById(String id);

  Future<Result<void>> insertCustomer(CustomerEntity entity);

  Future<Result<void>> updateCustomer(
    String id,
    CustomerEntity companion,
  );

  Future<Result<void>> deleteCustomer(String id);
}