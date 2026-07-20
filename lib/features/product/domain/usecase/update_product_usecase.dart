import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class UpdateProductUsecase {
  final ProductRepository _repository;
  const UpdateProductUsecase(this._repository);

  Future<Result<void>> call(ProductEntity product) async {
    return await _repository.updateProduct(product);
  }
}
