import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetProductVariantByBarcodeUsecase {
  final ProductRepository _repository;
  const GetProductVariantByBarcodeUsecase(this._repository);
  Future<Result<ProductVariantEntity>> call(String barcode) async {
    return await _repository.findByBarcode(barcode);
  }
}
