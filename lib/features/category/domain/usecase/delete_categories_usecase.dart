import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';

class DeleteCategoriesUsecase {
  final CategoryRepository _categoryRepository;

  const DeleteCategoriesUsecase(this._categoryRepository);

  Future<Result<void>> call(int id) async {
    return await _categoryRepository.deleteCategory(id);
  }
}