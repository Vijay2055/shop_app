import 'package:drift/drift.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/errors/failure.dart';

import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/data/models/history_model.dart';
import 'package:shop_app/features/udhar/data/models/udhar_summary_model.dart';

class HistoryDatasource {
  final AppDatabase db;

  HistoryDatasource(this.db);

  // =====================================================
  // INIT COUNTER
  // =====================================================
  Future<Result<void>> init() async {
    try {
      final data = await db.select(db.counterTable).get();

      if (data.isEmpty) {
        await db
            .into(db.counterTable)
            .insert(
              const CounterTableCompanion(
                id: Value(1),
                currentBillNumber: Value('BILL_001'),
              ),
            );
      }

      return Result.success(null);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // GET CURRENT BILL
  // =====================================================
  Future<Result<String>> getCurrentBill() async {
    try {
      final row = await db.select(db.counterTable).getSingle();
      return Result.success(row.currentBillNumber);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // GENERATE NEXT BILL
  // =====================================================
  String _nextBill(String current) {
    final number = int.parse(current.split('_')[1]);
    final next = number + 1;
    return 'BILL_${next.toString().padLeft(3, '0')}';
  }

  // =====================================================
  // INCREMENT BILL
  // =====================================================
  Future<Result<String>> incrementBill() async {
    try {
      final row = await db.select(db.counterTable).getSingle();
      final next = _nextBill(row.currentBillNumber);

      await (db.update(db.counterTable)..where((t) => t.id.equals(1))).write(
        CounterTableCompanion(currentBillNumber: Value(next)),
      );

      return Result.success(next);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // CREATE BILL (USES DOMAIN MODEL)
  // =====================================================
  Future<Result<String>> createBill({
    required HistoryModel history,
    required List<PurchaseItem> items,
  }) async {
    try {
      return await db.transaction(() async {
        final billId = await getCurrentBill();

        if (billId.data == null) {
          throw Exception("Failed to get bill id");
        }

        final id = billId.data!;

        // 1. insert history
        await db
            .into(db.historyTable)
            .insert(
              HistoryTableCompanion.insert(
                id: id,
                total: history.total,
                udharId: Value(history.udharId),
                status: Value(history.status ?? 'completed'),
              ),
            );

        // 2. insert items
        for (final item in items) {
          await db
              .into(db.purchaseItemTable)
              .insert(
                PurchaseItemTableCompanion.insert(
                  historyId: id,
                  productId: item.productId,
                  productName: item.productName,
                  priceAtPurchase: item.priceAtPurchase,
                  quantity: item.quantity,
                ),
              );
        }

        // 3. increment bill
        await incrementBill();

        return Result.success(id);
      });
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // GET ALL HISTORY
  // =====================================================
  Future<Result<List<HistoryTableData>>> getAllHistory() async {
    try {
      final data = await db.select(db.historyTable).get();

      return Result.success(data);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // GET BILL DETAIL
  // =====================================================
  Future<Result<HistoryDetail>> getBillDetail(String billId) async {
    try {
      final history = await (db.select(
        db.historyTable,
      )..where((t) => t.id.equals(billId))).getSingle();

      final items = await (db.select(
        db.purchaseItemTable,
      )..where((t) => t.historyId.equals(billId))).get();

      return Result.success(HistoryDetail(history: history, items: items));
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // DELETE BILL
  // =====================================================
  Future<Result<void>> deleteBill(String billId) async {
    try {
      await db.transaction(() async {
        await (db.delete(
          db.purchaseItemTable,
        )..where((t) => t.historyId.equals(billId))).go();

        await (db.delete(
          db.historyTable,
        )..where((t) => t.id.equals(billId))).go();
      });

      return Result.success(null);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // =====================================================
  // UPDATE UDHAR
  // =====================================================
  Future<Result<void>> updateUdhar({
    required String billId,
    required int? udharId,
  }) async {
    try {
      await (db.update(db.historyTable)..where((t) => t.id.equals(billId)))
          .write(HistoryTableCompanion(udharId: Value(udharId)));

      return Result.success(null);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  // get udhars list
  Future<List<HistoryTableData>> getActiveBills(int udharId) async {
    return await (db.select(db.historyTable)
          ..where((t) => t.udharId.equals(udharId))
          ..where((t) => t.status.equals('pending')))
        .get();
  }

  Future<bool> markBillDone(String billId) async {
    final rows =
        await (db.update(
          db.historyTable,
        )..where((t) => t.id.equals(billId))).write(
          const HistoryTableCompanion(
            // status: Value('done'),
          ),
        );

    return rows > 0;
  }

  Future<List<UdharSummaryModel>> getPendingUdharSummaries() async {
    final query = db.select(db.udharTable).join([
      innerJoin(
        db.historyTable,
        db.historyTable.udharId.equalsExp(db.udharTable.id),
      ),
    ])..where(db.historyTable.status.equals('pending'));

    final rows = await query.get();

    final Map<int, UdharSummaryModel> result = {};

    for (final row in rows) {
      final udhar = row.readTable(db.udharTable);
      final history = row.readTable(db.historyTable);

      if (result.containsKey(udhar.id)) {
        final old = result[udhar.id]!;

        result[udhar.id] = UdharSummaryModel(
          udharId: old.udharId,
          customerName: old.customerName,
          mobileNumber: old.mobileNumber,
          address: old.address,
          totalPendingAmount: old.totalPendingAmount + history.total,
        );
      } else {
        result[udhar.id] = UdharSummaryModel(
          udharId: udhar.id,
          customerName: udhar.customerName,
          mobileNumber: udhar.mobileNumber,
          address: udhar.address,
          totalPendingAmount: history.total,
        );
      }
    }

    return result.values.toList();
  }

  Future<int> insertUdhar(UdharTableCompanion data) async {
    final id = await db.into(db.udharTable).insert(data);
    return id > 0 ? id : throw Exception("Failed to insert udhar");
  }
}

// =====================================================
// DETAIL MODEL
// =====================================================

class HistoryDetail {
  final HistoryTableData history;
  final List<PurchaseItemTableData> items;

  HistoryDetail({required this.history, required this.items});
}
