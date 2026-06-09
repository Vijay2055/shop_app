import 'package:drift/drift.dart';
import 'history_table.dart';

class PurchaseItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Which history this item belongs to
  TextColumn get historyId =>
      text().references(HistoryTable, #id)();

  TextColumn get productId => text()();

  TextColumn get productName => text()();

  RealColumn get priceAtPurchase => real()();

  IntColumn get quantity => integer()();
}