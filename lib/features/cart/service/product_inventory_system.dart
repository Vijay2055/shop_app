import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class InventoryService {
  final ProductRepository repo;

  InventoryService(this.repo);

  Future<bool> canAddToCart({
    required String productBarcode,
    required int currentCartQty,
  }) async {
    final product = await repo.findByBarcode(productBarcode);

    if (!product.isSuccess) return false;
    if (product.data == null) return false;
   
    return currentCartQty < product.data!.stock;
  }
}
