import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_entity.dart';
import 'package:shop_app/features/sales/domain/entity/sale_item_entity.dart';

class SaleHistoryDetailEntity {
  final SaleEntity sale;
  final CustomerEntity? customer;
  final List<SaleItemEntity> items;

  const SaleHistoryDetailEntity({
    required this.sale,
    this.customer,
    required this.items,
  });
}