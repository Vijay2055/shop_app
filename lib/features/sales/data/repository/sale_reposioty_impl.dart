import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/sales/data/datasouce/sales_data_source.dart';
import 'package:shop_app/features/sales/data/mappers/sale_item_model_mapper.dart';
import 'package:shop_app/features/sales/data/mappers/sale_model_mapper.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';
import 'package:shop_app/features/sales/domain/repositoy/sale_reposioty.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleLocalDataSource _localDataSource;
  

  const SaleRepositoryImpl(this._localDataSource);

  @override
  Future<Result<SaleEntity>> completeSale({
    required SaleEntity sale,
    required List<SaleItemEntity> saleItems,
  }) async {
    try {
      final result = await _localDataSource.completeSale(
        sale: sale,
        saleItems: saleItems,
      );

      return Success(result.toEntity());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<SaleEntity>>> getSales() async {
    try {
      final rows = await _localDataSource.getSales();

      return Success(rows.map((e) => e.toEntity()).toList());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<SaleEntity>> getSaleById(String saleId) async {
    try {
      final row = await _localDataSource.getSaleById(saleId);

      return Success(row.toEntity());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<SaleItemEntity>>> getSaleItems(String saleId) async {
    try {
      final rows = await _localDataSource.getSaleItems(saleId);

      return Success(rows.map((e) => e.toEntity()).toList());
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteSale(String saleId) async {
    try {
      await _localDataSource.deleteSale(saleId);

      return Success(null);
    } catch (e) {
      return FailureResult(DatabaseFailure(e.toString()));
    }
  }
}
