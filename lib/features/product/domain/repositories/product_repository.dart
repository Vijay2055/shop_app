import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';

abstract class ProductRepository {
  // ------------------------
  // Product
  // ------------------------

  Future<Result<List<ProductEntity>>> getProducts({
    required int limit,
    required int page,
  });

  Future<Result<int>> getProductCounts();
  Future<Result<ProductEntity?>> getProductById(String id);

  Future<Result<List<ProductEntity>>> searchProducts(String query);

  Future<Result<void>> addProduct(ProductEntity product);

  Future<Result<void>> updateProduct(ProductEntity product);

  Future<Result<void>> deleteProduct(String productId);
  Future<Result<List<ProductVariantEntity>>> searchProductVariants(
    String query,
  );

  // ------------------------
  // Product Variant
  // ------------------------

  Future<Result<List<ProductVariantEntity>>> getVarientList({
    required int page,
    required int limit,
  });
  Future<Result<List<ProductVariantEntity>>> getVariants(String productId);

  Future<Result<ProductVariantEntity?>> getVariantById(String variantId);

  Future<Result<void>> addVariant(ProductVariantEntity variant);

  Future<Result<void>> updateVariant(ProductVariantEntity variant);

  Future<Result<void>> deleteVariant(String variantId);

  Future<Result<ProductVariantEntity>> findByBarcode(String barcode);

  Future<Result<ProductVariantEntity?>> findBySku(String sku);

  Future<Result<void>> addProductWithVariant(
    ProductEntity product,
    List<ProductVariantEntity> variants,
  );

  Future<Result<void>> updateProductWithVariant(
    ProductEntity product,
    List<ProductVariantEntity> variants,
  );

  Future<Result<int>> getProductVariantCount();
  Future<Result<String>> getBarcode();
  Future<Result<String>> getSku();

  // Future<Result<ProductForEdit>> getProductForEdit(String productId);
}
