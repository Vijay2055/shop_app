import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class AddProductUsecase {
  final ProductRepository _repository;
  const AddProductUsecase(this._repository);

  Future<Result<void>> call(
    ProductEntity product,
    List<ProductVariantEntity> variants,
  ) async {
    return await _repository.addProductWithVariant(product, variants);
  }
}