import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/database/providers/app_database_provider.dart';
import 'package:shop_app/features/customer/data/mapper/customer_enitity_to_companion.dart';
import 'package:shop_app/features/history/data/dto/sales_history_dto.dart';
import 'package:shop_app/features/history/domain/entity/sale_history_detail_entity.dart';
import 'package:shop_app/features/sales/data/mappers/sale_item_model_mapper.dart';
import 'package:shop_app/features/sales/data/mappers/sale_model_mapper.dart';

abstract interface class SaleHistoryLocalDataSource {
  Future<List<SaleHistoryDto>> getSaleHistory({
    required int page,
    required int limit,
    String? search,
    String? paymentStatus,
  });

  Future<int> getSaleHistoryCount({String? search});
  Future<SaleHistoryDetailEntity?> getSaleHistoryDetail(String saleId);
  Future<void> receivePayment({required String saleId, required double amount});
  Future<void> deleteHistory({required String saleId});
}

class SaleHistoryLocalDatasourceImpl implements SaleHistoryLocalDataSource {
  final AppDatabase db;

  SaleHistoryLocalDatasourceImpl(this.db);

  @override
  Future<List<SaleHistoryDto>> getSaleHistory({
    required int page,
    required int limit,
    String? search,
    String? paymentStatus,
  }) async {
    final offset = (page - 1) * limit;

    final totalItemsExp = db.saleItems.quantity.sum();

    final query = db.selectOnly(db.sales)
      ..addColumns([
        db.sales.id,
        db.sales.invoiceNumber,
        db.sales.createdAt,
        db.sales.grandTotal,
        db.sales.saleType,
        db.sales.paymentStatus,
        db.sales.status,
        db.customers.name,
        totalItemsExp,
      ])
      ..join([
        leftOuterJoin(
          db.customers,
          db.customers.id.equalsExp(db.sales.customerId),
        ),
        leftOuterJoin(db.saleItems, db.saleItems.saleId.equalsExp(db.sales.id)),
      ]);

    if (search != null && search.trim().isNotEmpty) {
      query.where(
        db.sales.invoiceNumber.like('%$search%') |
            db.customers.name.like('%$search%'),
      );
    }

    if (paymentStatus != null && paymentStatus != 'all') {
      query.where(db.sales.paymentStatus.equals(paymentStatus));
    }

    query
      ..groupBy([
        db.sales.id,
        db.sales.invoiceNumber,
        db.sales.createdAt,
        db.sales.grandTotal,
        db.sales.saleType,
        db.sales.status,
        db.sales.paymentStatus,
        db.customers.name,
      ])
      ..orderBy([OrderingTerm.desc(db.sales.createdAt)])
      ..limit(limit, offset: offset);

    final rows = await query.get();

    return rows.map((row) {
      debugPrint(row.read(db.sales.paymentStatus));
      return SaleHistoryDto(
        id: row.read(db.sales.id)!,
        invoiceNumber: row.read(db.sales.invoiceNumber)!,
        customerName: row.read(db.customers.name) ?? 'Walk-in Customer',
        totalItems: row.read(totalItemsExp) ?? 0,
        grandTotal: row.read(db.sales.grandTotal)!,
        saleType: row.read(db.sales.saleType)!,
        status: row.read(db.sales.status)!,
        paymentStatus: row.read(db.sales.paymentStatus)!,
        // sfd:row.read(db.sales.dueAmount),
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          row.read(db.sales.createdAt)!,
        ),
      );
    }).toList();
  }

  @override
  Future<int> getSaleHistoryCount({String? search}) async {
    final countExp = db.sales.id.count();

    final query = db.selectOnly(db.sales)
      ..addColumns([countExp])
      ..join([
        leftOuterJoin(
          db.customers,
          db.customers.id.equalsExp(db.sales.customerId),
        ),
      ]);

    if (search != null && search.trim().isNotEmpty) {
      query.where(
        db.sales.invoiceNumber.like('%$search%') |
            db.customers.name.like('%$search%'),
      );
    }

    final row = await query.getSingle();

    return row.read(countExp) ?? 0;
  }

  Future<SaleHistoryDetailEntity?> getSaleHistoryDetail(String saleId) async {
    final sale = await (db.select(
      db.sales,
    )..where((t) => t.id.equals(saleId))).getSingleOrNull();

    if (sale == null) return null;

    Customer? customer;

    if (sale.customerId != null) {
      customer = await (db.select(
        db.customers,
      )..where((t) => t.id.equals(sale.customerId!))).getSingleOrNull();
    }

    final items = await (db.select(
      db.saleItems,
    )..where((t) => t.saleId.equals(saleId))).get();

    return SaleHistoryDetailEntity(
      sale: sale.toEntity(),
      customer: customer?.toEntity(),
      items: items.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<void> receivePayment({
    required String saleId,
    required double amount,
  }) async {
    await db.transaction(() async {
      final sale = await (db.select(
        db.sales,
      )..where((t) => t.id.equals(saleId))).getSingle();

      final newPaidAmount = sale.paidAmount + amount;
      final newDueAmount = (sale.grandTotal - newPaidAmount).clamp(
        0.0,
        double.infinity,
      );

      final paymentStatus = newDueAmount == 0
          ? "paid"
          : newPaidAmount == 0
          ? "unpaid"
          : "partial";

      await (db.update(db.sales)..where((t) => t.id.equals(saleId))).write(
        SalesCompanion(
          paidAmount: Value(newPaidAmount),
          dueAmount: Value(newDueAmount),
          paymentStatus: Value(paymentStatus),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  @override
  Future<void> deleteHistory({required String saleId}) async {
    await db.transaction(() async {
      // Delete all items belonging to this sale first.
      await (db.delete(
        db.saleItems,
      )..where((t) => t.saleId.equals(saleId))).go();

      // Then delete the sale itself.
      await (db.delete(db.sales)..where((t) => t.id.equals(saleId))).go();
    });
  }
}

final salseHisoryLocalDataSourcceProvider =
    Provider<SaleHistoryLocalDataSource>((ref) {
      return SaleHistoryLocalDatasourceImpl(ref.watch(appDatabaseProvider));
    });
