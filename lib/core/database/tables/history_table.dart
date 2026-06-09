import 'package:drift/drift.dart';
import 'udhar_table.dart';

class HistoryTable extends Table {
  TextColumn get id => text()();

  /// Nullable foreign key
  IntColumn get udharId => integer().nullable().references(UdharTable, #id)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  TextColumn get status => text().withDefault(const Constant('completed'))();

  RealColumn get total => real()();

  @override
  Set<Column> get primaryKey => {id};
}
