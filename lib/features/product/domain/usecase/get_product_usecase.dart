import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetProductUsecase {
  final ProductRepository repository;
  const GetProductUsecase({required this.repository});
  Future<Result<List<ProductEntity>>> call(
    {
       int limit=20,
       int page=1,
    }
  ) async {
    return await repository.getProducts(
      limit: limit,
      page: page
    );
  }
}
