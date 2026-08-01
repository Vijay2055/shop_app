import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/database/providers/app_database_provider.dart';
import 'package:shop_app/features/sales/data/mappers/sale_to_companion.dart';
import 'package:shop_app/features/sales/data/mappers/sale_item_to_compoanion.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';

abstract class SaleLocalDataSource {
  Future<Sale> completeSale({
    required SaleEntity sale,
    required List<SaleItemEntity> saleItems,
  });

  Future<List<Sale>> getSales();

  Future<Sale> getSaleById(String id);

  Future<List<SaleItem>> getSaleItems(String saleId);

  Future<void> deleteSale(String saleId);
}

class SaleLocalDataSourceImpl implements SaleLocalDataSource {
  final AppDatabase _db;

  SaleLocalDataSourceImpl(this._db);

  @override
  Future<Sale> completeSale({
    required SaleEntity sale,
    required List<SaleItemEntity> saleItems,
  }) async {
    return await _db.transaction(() async {
      //-----------------------------
      // 1. Validate cart
      //-----------------------------
      if (saleItems.isEmpty) {
        throw Exception("Cart is empty");
      }

      //-----------------------------
      // 2. Generate Invoice Number
      //-----------------------------
      final invoiceNumber = await _generateInvoiceNumber();

      //-----------------------------
      // 3. Re-check Stock
      //-----------------------------
      for (final item in saleItems) {
        final variant = await (_db.select(
          _db.productVariants,
        )..where((tbl) => tbl.id.equals(item.variantId))).getSingle();

        if (variant.stock < item.quantity) {
          throw Exception(
            "${variant.variant} has only ${variant.stock} item(s) left.",
          );
        }
      }

      //-----------------------------
      // 4. Insert Sale
      //-----------------------------
      final saleRow = sale.copyWith(invoiceNumber: invoiceNumber);

      await _db.into(_db.sales).insert(saleRow.toCompanion());

      //-----------------------------
      // 5. Insert Sale Items
      //-----------------------------
      await _db.batch((batch) {
        batch.insertAll(
          _db.saleItems,
          saleItems.map((e) => e.toCompanion()).toList(),
        );
      });

      //-----------------------------
      // 6. Update Stock
      //-----------------------------
      for (final item in saleItems) {
        final variant = await (_db.select(
          _db.productVariants,
        )..where((tbl) => tbl.id.equals(item.variantId))).getSingle();

        await (_db.update(
          _db.productVariants,
        )..where((tbl) => tbl.id.equals(item.variantId))).write(
          ProductVariantsCompanion(stock: Value(variant.stock - item.quantity)),
        );
      }

      //-----------------------------
      // 7. Increment Invoice
      //-----------------------------
      await _incrementInvoiceNumber();

      //-----------------------------
      // 8. Return Sale
      //-----------------------------
      return (_db.select(
        _db.sales,
      )..where((tbl) => tbl.id.equals(sale.id))).getSingle();
    });
  }

  @override
  Future<List<Sale>> getSales() {
    return _db.select(_db.sales).get();
  }

  @override
  Future<Sale> getSaleById(String id) {
    return (_db.select(
      _db.sales,
    )..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  @override
  Future<List<SaleItem>> getSaleItems(String saleId) {
    return (_db.select(
      _db.saleItems,
    )..where((tbl) => tbl.saleId.equals(saleId))).get();
  }

  @override
  Future<void> deleteSale(String saleId) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.saleItems,
      )..where((tbl) => tbl.saleId.equals(saleId))).go();

      await (_db.delete(_db.sales)..where((tbl) => tbl.id.equals(saleId))).go();
    });
  }

  //-------------------------------------------------------
  // Helpers
  //-------------------------------------------------------

  Future<String> _generateInvoiceNumber() async {
    final prefix = await _getSetting("invoice_prefix") ?? "BILL";
    final next = int.parse(await _getSetting("next_invoice_number") ?? "1");

    return "$prefix-${next.toString().padLeft(4, "0")}";
  }

  Future<void> _incrementInvoiceNumber() async {
    final current = int.parse(await _getSetting("next_invoice_number") ?? "1");

    await _saveSetting("next_invoice_number", (current + 1).toString());
  }

  Future<String?> _getSetting(String key) async {
    final row = await (_db.select(
      _db.appSettings,
    )..where((tbl) => tbl.key.equals(key))).getSingleOrNull();

    return row?.value;
  }

  Future<void> _saveSetting(String key, String value) async {
    await _db
        .into(_db.appSettings)
        .insertOnConflictUpdate(
          AppSettingsCompanion.insert(key: key, value: value),
        );
  }
}

final saleLocalDataSourceProvider = Provider<SaleLocalDataSource>((ref) {
  return SaleLocalDataSourceImpl(ref.watch(appDatabaseProvider));
});
