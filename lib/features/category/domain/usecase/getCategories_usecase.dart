import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';

class GetcategoriesUsecase {
  final CategoryRepository categoryRepository;
  const GetcategoriesUsecase(this.categoryRepository);

  Future<Result<List<CategoryEntity>>> call() async {
    return await categoryRepository.getCategories();
  }
}