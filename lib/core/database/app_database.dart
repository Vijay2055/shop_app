import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_app/core/database/tables/app_setings.dart';

import 'package:shop_app/core/database/tables/category_tables.dart';
import 'package:shop_app/core/database/tables/customer_table.dart';
import 'package:shop_app/core/database/tables/product_variant_table.dart';
import 'package:shop_app/core/database/tables/sales_item_table.dart';
import 'package:shop_app/core/database/tables/sales_table.dart';
import 'package:shop_app/core/database/tables/sku_barcode_tracker.dart';

import 'tables/product_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Products,
    Categories,
    ProductVariants,
    Customers,
    Sales,
    SaleItems,
    AppSettings,
    SkuBarcodeTracker
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // if (from < 5) {
      //   await m.addColumn(sales, sales.paymentStatus);
      // }

      // await m.deleteDatabase();
      // await m.createAll();
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/pos.sqlite');

    // if (await file.exists()) {
    //   file.deleteSync();
    // }

    return NativeDatabase(file);
  });
}


//  UdharTable,
//     HistoryTable,
//     PurchaseItemTable,
//     CounterTable,