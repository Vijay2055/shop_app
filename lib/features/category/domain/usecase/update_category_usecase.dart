
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';

class UpdateCategoryUsecase {
  final CategoryRepository _categoryRepository;

  UpdateCategoryUsecase(this._categoryRepository);

  Future<Result<void>> call(CategoryEntity category) async {
    return await _categoryRepository.updateCategory(category);
  }
}