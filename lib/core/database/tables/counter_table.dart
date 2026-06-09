import 'package:drift/drift.dart';

class CounterTable extends Table {
  IntColumn get id => integer()();

  TextColumn get currentBillNumber =>
      text().withDefault(const Constant('BILL_001'))();

  @override
  Set<Column> get primaryKey => {id};
}