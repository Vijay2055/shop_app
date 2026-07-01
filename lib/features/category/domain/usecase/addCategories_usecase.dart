import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';

class AddCategoriesUseCase {
   final CategoryRepository repository;

   AddCategoriesUseCase(this.repository);

   Future<Result<void>> call(CategoryEntity category) async {
     return await repository.addCategory(category);
   }
 }