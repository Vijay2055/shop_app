import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class SearchProductsUsecase {
  final ProductRepository _productRepository;

  SearchProductsUsecase(this._productRepository);
  
  Future<Result<List<ProductEntity>>> call(String query) async {
   return await _productRepository.searchProducts(query);
  }
}
