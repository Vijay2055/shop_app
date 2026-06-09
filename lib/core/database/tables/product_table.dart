import 'package:drift/drift.dart';
import 'package:shop_app/core/database/tables/category_tables.dart';

class Products extends Table {
  TextColumn get id => text()();
  RealColumn get price => real()();
  TextColumn get name => text()();
  TextColumn get barcode => text().unique()();
  IntColumn get stock => integer()();
  TextColumn get categoryId =>
      text().references(Categories, #id)();
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {id};
}
