import 'package:shop_app/features/homepage/domain/entity/top_selling_entity.dart';

class TopSellingDto extends TopSellingEntity {
  const TopSellingDto({
    required super.variantId,
    required super.productName,
    required super.sku,
    required super.quantitySold,
    required super.revenue,
    required super.profit,
  });
}
