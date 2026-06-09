import 'package:drift/drift.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/history/data/models/history_model.dart';
import 'package:shop_app/features/history/datasource/history_data.dart';
import 'package:shop_app/features/udhar/data/models/udhar.dart';

import 'package:shop_app/features/udhar/data/models/udhar_summary_model.dart';
import 'package:shop_app/features/udhar/domain/repository/udhar_repository.dart';

class UdharRepositoryImpl extends UdharRepository {
  final HistoryDatasource _dataSource;
  UdharRepositoryImpl(this._dataSource);
  @override
  Future<Result<int>> addUdhar(Udhar udhar) async {
    try {
      final data = UdharTableCompanion(
        customerName: Value(udhar.customerName),
        mobileNumber: Value(udhar.mobile),
        address: Value(udhar.address),
      );
      final id = await _dataSource.insertUdhar(data);
      return Result.success(id);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<UdharSummaryModel>>> getAllUdhars() async {
    try {
      final data = await _dataSource.getPendingUdharSummaries();
  
      return Result.success(data);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<HistoryModel>>> getUdharHistory(int udharId) async {
    try {
      final data = await _dataSource.getActiveBills(udharId);
      final mappedHistoryDetail = data
          .map((e) => HistoryModel.fromDrift(e))
          .toList();
      return Result.success(mappedHistoryDetail);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool>> markUdharDone(String billid) async {
    try {
      final result = await _dataSource.markBillDone(billid);
      return Result.success(result);
    } catch (e) {
      return Result.failure(DatabaseFailure(e.toString()));
    }
  }
}
