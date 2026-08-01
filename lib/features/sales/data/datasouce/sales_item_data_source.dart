import 'package:shop_app/core/database/app_database.dart';

abstract class SaleItemLocalDataSource {
  Future<List<SaleItem>> getSaleItems(
    String saleId,
  );

  Future<void> insertSaleItem(
    SaleItemsCompanion companion,
  );

  Future<void> insertSaleItems(
    List<SaleItemsCompanion> companions,
  );

  Future<void> deleteSaleItems(
    String saleId,
  );
}