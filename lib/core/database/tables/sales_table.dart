import 'package:drift/drift.dart';
import 'package:shop_app/core/database/tables/customer_table.dart';

class Sales extends Table {
  TextColumn get id => text()();

  TextColumn get invoiceNumber => text().unique()();

  TextColumn get customerId => text().nullable().references(Customers, #id)();

  TextColumn get saleType => text()(); // cash, credit

  TextColumn get status => text().withDefault(const Constant('completed'))();
  TextColumn get paymentStatus => text().withDefault(const Constant('paid'))();

  RealColumn get subtotal => real()();

  RealColumn get discountAmount => real().withDefault(const Constant(0))();

  RealColumn get vatAmount => real().withDefault(const Constant(0))();

  RealColumn get grandTotal => real()();

  RealColumn get paidAmount => real()();

  RealColumn get dueAmount => real()();

  TextColumn get note => text().nullable()();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
