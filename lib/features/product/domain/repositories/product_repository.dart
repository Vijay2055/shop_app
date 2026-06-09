import 'package:shop_app/features/product/domain/entities/product.dart';
import '../../../../core/utils/result.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();
  Future<Result<void>> addProduct(Product product);
  Future<Result<void>> deleteProduct(String productId);
  Future<Result<void>> updateProduct(Product product);
  Future<Result<Product?>> findByBarcode(String barcode);
  Future<Result<List<Product>>> searchProducts(String query);
}