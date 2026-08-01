import 'package:drift/drift.dart';
import 'package:shop_app/core/database/tables/product_table.dart';

class ProductVariants extends Table {
  TextColumn get id => text()();

  TextColumn get productId => text().references(Products, #id)();

  TextColumn get sku => text().unique()();

  TextColumn get barcode => text().unique()();

  TextColumn get color => text().nullable()();

  TextColumn get variant => text()();

  RealColumn get costPrice => real().withDefault(const Constant(0))();

  RealColumn get sellingPrice => real().withDefault(const Constant(0))();

  RealColumn get mrp => real().withDefault(const Constant(0))();

  RealColumn get vatPercent => real().withDefault(const Constant(0))();

  RealColumn get discountPercent => real().withDefault(const Constant(0))();

  IntColumn get stock => integer().withDefault(const Constant(0))();

  IntColumn get minimumStock => integer().withDefault(const Constant(5))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
