import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/database/providers/app_database_provider.dart';

abstract class CustomerLocalDataSource {
  Future<List<Customer>> getAllCustomers();

  Future<Customer> getCustomerById(String id);

  Future<void> insertCustomer(CustomersCompanion companion);

  Future<void> updateCustomer(String id, CustomersCompanion companion);

  Future<void> deleteCustomer(String id);
}

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  final AppDatabase _db;

  CustomerLocalDataSourceImpl(this._db);

  @override
  Future<List<Customer>> getAllCustomers() {
    return _db.select(_db.customers).get();
  }

  @override
  Future<Customer> getCustomerById(String id) {
    return (_db.select(
      _db.customers,
    )..where((t) => t.id.equals(id))).getSingle();
  }

  @override
  Future<void> insertCustomer(CustomersCompanion companion) async {
    await _db.into(_db.customers).insert(companion);
  }

  @override
  Future<void> updateCustomer(String id, CustomersCompanion companion) async {
    await (_db.update(
      _db.customers,
    )..where((t) => t.id.equals(id))).write(companion);
  }

  @override
  Future<void> deleteCustomer(String id) async {
    await (_db.delete(_db.customers)..where((t) => t.id.equals(id))).go();
  }
}

final customerLocalDataSourceProvider = Provider<CustomerLocalDataSource>((
  ref,
) {
  return CustomerLocalDataSourceImpl(ref.watch(appDatabaseProvider));
});
