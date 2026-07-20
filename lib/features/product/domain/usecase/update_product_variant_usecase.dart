import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class UpdateProductVariantUsecase {
  final ProductRepository _repository;
  const UpdateProductVariantUsecase(this._repository);

  Future<Result<void>> call(ProductVariantEntity entity) async {
    return await _repository.updateVariant(entity);
  }
}
