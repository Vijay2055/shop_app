import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetProductCounts {
  final ProductRepository _repository;
  const GetProductCounts(this._repository);

  Future<Result<int>> call() {
    return _repository.getProductCounts();
  }
}
