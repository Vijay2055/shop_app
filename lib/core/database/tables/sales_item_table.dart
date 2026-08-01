import 'package:drift/drift.dart';
import 'package:shop_app/core/database/tables/product_variant_table.dart';
import 'package:shop_app/core/database/tables/sales_table.dart';

class SaleItems extends Table {
  TextColumn get id => text()();
  TextColumn get saleId => text().references(Sales, #id)();

  TextColumn get variantId => text().references(ProductVariants, #id)();

  TextColumn get productId => text()();

  TextColumn get productName => text()();

  TextColumn get sku => text()();

  TextColumn get barcode => text()();

  TextColumn get color => text().nullable()();

  TextColumn get variant => text()();

  RealColumn get costPrice => real()();

  RealColumn get sellingPrice => real()();

  RealColumn get mrp => real()();

  RealColumn get vatPercent => real().withDefault(const Constant(0))();

  RealColumn get discountPercent => real().withDefault(const Constant(0))();

  IntColumn get quantity => integer()();

  RealColumn get lineTotal => real()();

  @override
  Set<Column> get primaryKey => {id};
}
