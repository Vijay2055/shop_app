import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';
import 'package:shop_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:shop_app/features/product/domain/usecase/add_product_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/generate_barcode_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/generate_sku_code.dart';
import 'package:shop_app/features/product/domain/usecase/getProductForEdit.dart';
import 'package:shop_app/features/product/domain/usecase/getProductVariantlist_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/getProduct_counts.dart';
import 'package:shop_app/features/product/domain/usecase/get_product_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/get_product_variant_by_barcode_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/get_product_variant_count_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/search_product_variants_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/search_products_usecase.dart';
import 'package:shop_app/features/product/domain/usecase/update_product_with_varient_usecase.dart';

final getProductsUseCaseProvider = Provider<GetProductUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductUsecase(repository: repository);
});

final searchProductsUseCaseProvider = Provider<SearchProductsUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return SearchProductsUsecase(repository);
});

final addProductWithVariantUsecaseProvider = Provider<AddProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return AddProductUseCase(repository);
});

final getProductCountsUsecaseProvider = Provider<GetProductCounts>((ref) {
  return GetProductCounts(ref.watch(productRepositoryProvider));
});

final getProductEditForUsecaseProvider = Provider<GetProductForEdit>((ref) {
  return GetProductForEdit(
    ref.watch(categoryRepositoryProvider),
    ref.watch(productRepositoryProvider),
  );
});

final updateProductWithVariantUsecaseProvider =
    Provider<UpdateProductWithVariantUseCase>((ref) {
      return UpdateProductWithVariantUseCase(
        ref.watch(productRepositoryProvider),
      );
    });

final getProductVariantListUsecaseProvider =
    Provider<GetproductvariantlistUsecase>((ref) {
      return GetproductvariantlistUsecase(ref.watch(productRepositoryProvider));
    });

final getProductVariantCountUsecaseProvider =
    Provider<GetProductVariantCountUsecase>((ref) {
      return GetProductVariantCountUsecase(
        ref.watch(productRepositoryProvider),
      );
    });

final getSearchedProductVariantCountUsecaseProvider =
    Provider<SearchProductVariantsUsecase>((ref) {
      return SearchProductVariantsUsecase(ref.watch(productRepositoryProvider));
    });

final getProductVariantByBarcodeUsecaseProvider =
    Provider<GetProductVariantByBarcodeUsecase>((ref) {
      return GetProductVariantByBarcodeUsecase(
        ref.watch(productRepositoryProvider),
      );
    });

final generateBarcodeProvider = Provider<GenerateBarcodeUsecase>((ref) {
  return GenerateBarcodeUsecase(ref.watch(productRepositoryProvider));
});

final generateSkuProvider = Provider<GenerateSkuUsecase>((ref) {
  return GenerateSkuUsecase(ref.watch(productRepositoryProvider));
});
