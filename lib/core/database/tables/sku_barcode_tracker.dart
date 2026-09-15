import 'package:drift/drift.dart';

class SkuBarcodeTracker extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sku => text()();
  TextColumn get barcode => text()();
  @override
  Set<Column> get primaryKey => {id};
}
