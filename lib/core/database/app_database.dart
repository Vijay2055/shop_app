import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'package:shop_app/core/database/tables/category_tables.dart';
import 'package:shop_app/core/database/tables/product_variant_table.dart';

import 'tables/product_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products, Categories, ProductVariants])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll(); // create all tables
    },

    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 4) {
        // await m.addColumn(historyTable, historyTable.status);
      }
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