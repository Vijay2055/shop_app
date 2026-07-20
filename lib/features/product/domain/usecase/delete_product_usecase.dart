import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class DeleteProductUsecase{
  final ProductRepository _repository;
  const DeleteProductUsecase(this._repository);
  Future<Result<void>> call(String productId) async{
    return await _repository.deleteProduct(productId);
  }
}