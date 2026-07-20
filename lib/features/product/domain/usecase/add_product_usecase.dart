import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_varient_draft.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';
import 'package:uuid/uuid.dart';

class AddProductUseCase {
  final ProductRepository _repository;

  const AddProductUseCase(this._repository);

  Future<Result<void>> call({
    required String name,
    required String description,
    required int categoryId,
    required List<ProductVariantDraft> variants,
  }) async {
    final now = DateTime.now();

    final productId = const Uuid().v4();

    final product = ProductEntity(
      id: productId,
      categoryId: categoryId,
      name: name,
      description: description,
      image: null,
      isActive: true,
      createdAt: now,
      updatedAt: now,
    );

    final productVariants = variants.map((draft) {
      return ProductVariantEntity(
        id: const Uuid().v4(),
        productId: productId,
        sku: draft.sku,
        barcode: draft.barcode,
        color: draft.color,
        size: draft.size,
        costPrice: draft.costPrice,
        sellingPrice: draft.sellingPrice,
        mrp: draft.mrp,
        vatPercent: draft.vatPercent,
        discountPercent: draft.discountPercent,
        stock: draft.stock,
        minimumStock: draft.minimumStock,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );
    }).toList();

    return _repository.addProductWithVariant(
      product,
      productVariants,
    );
  }
}