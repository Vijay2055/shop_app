import 'package:drift/drift.dart';

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().unique()();
  
  // Nullable column for description
  TextColumn get description => text().nullable()();

  // Custom column name matching the DB snake_case with a default value
  IntColumn get productCount => integer()
      .named('product_count')
      .withDefault(const Constant(0))();

  // Boolean column mapping to a custom name with a default value
  BoolColumn get isActive => boolean()
      .named('is_active')
      .withDefault(const Constant(true))();

  // DateTime columns mapping to their respective database names
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};
}