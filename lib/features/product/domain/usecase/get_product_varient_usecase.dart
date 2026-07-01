import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetProductVarientUsecase {
  final ProductRepository _productRepository;
  const GetProductVarientUsecase(this._productRepository);

  Future<Result<List<ProductVariantEntity>>> call(String productId) async {
    return await _productRepository.getVariants(productId);
  }
}