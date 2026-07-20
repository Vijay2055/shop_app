import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetproductvariantlistUsecase {
  final ProductRepository _repository;
  const GetproductvariantlistUsecase(this._repository);
  Future<Result<List<ProductVariantEntity>>> call({
    int limit = 20,
    int page = 1,
  }) {
    return _repository.getVarientList(page: page, limit: limit);
  }
}


