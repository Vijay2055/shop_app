import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/domain/repository/category_repository.dart';
import 'package:shop_app/features/category/domain/usecase/addCategories_usecase.dart';
import 'package:shop_app/features/category/domain/usecase/delete_categories_usecase.dart';
import 'package:shop_app/features/category/domain/usecase/getCategories_usecase.dart';
import 'package:shop_app/features/category/domain/usecase/update_category_usecase.dart';

final getCategoriesUsecaseProvider = Provider<GetcategoriesUsecase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return GetcategoriesUsecase(categoryRepository);
});

final deleteCategoriesUsecaseProvider = Provider<DeleteCategoriesUsecase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return DeleteCategoriesUsecase(categoryRepository);
});

final updateCategoryUsecaseProvider = Provider<UpdateCategoryUsecase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return UpdateCategoryUsecase(categoryRepository);
});

final addCategoryUsecaseProvider = Provider<AddCategoriesUseCase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return AddCategoriesUseCase(categoryRepository);
});