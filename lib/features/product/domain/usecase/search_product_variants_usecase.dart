import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class SearchProductVariantsUsecase {
  final ProductRepository _repository;
  const SearchProductVariantsUsecase(this._repository);
  Future<Result<List<ProductVariantEntity>>> call(String query) {
    return _repository.searchProductVariants(query);
  }
}
