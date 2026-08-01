import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/customer/data/datasource/custome_local_data_source.dart';
import 'package:shop_app/features/customer/data/mapper/customer_enitity_to_companion.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';
import 'package:shop_app/features/customer/domain/repository/customer_reposioty.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final CustomerLocalDataSource _dataSource;

  CustomerRepositoryImpl(this._dataSource);

  @override
  Future<Result<void>> deleteCustomer(String id) {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<Result<List<CustomerEntity>>> getAllCustomers() {
    // TODO: implement getAllCustomers
    throw UnimplementedError();
  }

  @override
  Future<Result<CustomerEntity>> getCustomerById(String id) {
    // TODO: implement getCustomerById
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> insertCustomer(CustomerEntity entity) async {
    try {
      await _dataSource.insertCustomer(entity.toCompanion());
      return Success(null);
    } on Exception catch (e, stackTrace) {
      debugPrint('Customer insert failed: $e');
      debugPrintStack(stackTrace: stackTrace);

      return FailureResult(DatabaseFailure("Failed to insert customer."));
    }
  }

  @override
  Future<Result<void>> updateCustomer(String id, CustomerEntity companion) {
    // TODO: implement updateCustomer
    throw UnimplementedError();
  }
}

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepositoryImpl(ref.watch(customerLocalDataSourceProvider));
});
