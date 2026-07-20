import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';

class ProductForEdit {
  final ProductEntity product;
  final CategoryEntity category;
  final List<ProductVariantEntity> variants;

  const ProductForEdit({
    required this.product,
    required this.category,
    required this.variants,
  });
}