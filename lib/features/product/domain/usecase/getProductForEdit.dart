import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';
import 'package:shop_app/features/product/domain/dto/product_for_edit.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/repositories/product_repository.dart';

class GetProductForEdit {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  const GetProductForEdit(this._categoryRepository, this._productRepository);

  Future<Result<ProductForEdit>> call(String productId) async {
    final productResult = await _productRepository.getProductById(productId);

    switch (productResult) {
      case FailureResult(:final failure):
        return FailureResult(failure);

      case Success<ProductEntity?>(:final data):
        if (data == null) {
          return FailureResult(DatabaseFailure("Product not found"));
        }

        if (data.category.id == null) {
          print("Errror in getProductForEdit usecase");
          return FailureResult(DatabaseFailure("Can;t find category id"));
        }
        final categoryResult = await _categoryRepository.getCategoryById(
          data.category.id!,
        );
        final variantResult = await _productRepository.getVariants(productId);

        switch ((categoryResult, variantResult)) {
          case (Success(data: final category), Success(data: final variants)):
            return Success(
              ProductForEdit(
                product: data,
                category: category,
                variants: variants,
              ),
            );

          case (FailureResult(:final failure), _):
            return FailureResult(failure);

          case (_, FailureResult(:final failure)):
            return FailureResult(failure);
        }
    }
  }
}
