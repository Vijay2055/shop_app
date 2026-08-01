import 'package:drift/drift.dart';

class Customers extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get phone => text().nullable()();

  TextColumn get address => text().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}