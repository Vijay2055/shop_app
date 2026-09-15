import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GenerateBarcodeUsecase {
  final ProductRepository _repository;
  const GenerateBarcodeUsecase(this._repository);
  Future<Result<String>> call() {
    return _repository.getBarcode();
  }
}
