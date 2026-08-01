import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/sales/data/datasouce/sales_data_source.dart';
import 'package:shop_app/features/sales/data/repository/sale_reposioty_impl.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';

abstract interface class SaleRepository {
  Future<Result<SaleEntity>> completeSale({
    required SaleEntity sale,
    required List<SaleItemEntity> saleItems,
  });

  Future<Result<List<SaleEntity>>> getSales();

  Future<Result<SaleEntity>> getSaleById(String saleId);

  Future<Result<List<SaleItemEntity>>> getSaleItems(String saleId);

  Future<Result<void>> deleteSale(String saleId);
}

final saleRepositoryProvider = Provider<SaleRepository>((ref) {
  return SaleRepositoryImpl(ref.watch(saleLocalDataSourceProvider));
});
