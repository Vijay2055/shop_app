import 'package:drift/drift.dart';
import 'package:shop_app/core/database/tables/category_tables.dart';

class Products extends Table {
  TextColumn get id => text()();

  IntColumn get categoryId => integer().references(Categories, #id)();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  TextColumn get image => text().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
