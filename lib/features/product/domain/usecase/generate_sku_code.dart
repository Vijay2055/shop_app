import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GenerateSkuUsecase {
  final ProductRepository _repository;
  const GenerateSkuUsecase(this._repository);
  Future<Result<String>> call() {
    return _repository.getSku();
  }
}
