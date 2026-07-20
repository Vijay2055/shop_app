import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetProductVariantCountUsecase {
  final ProductRepository _repository;
  const GetProductVariantCountUsecase(this._repository);

  Future<Result<int>> call() {
    return _repository.getProductVariantCount();
  }
}
