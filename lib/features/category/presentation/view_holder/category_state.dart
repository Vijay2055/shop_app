import 'package:shop_app/features/category/domain/entity/category_entity.dart';

class CategoryState {
  final List<CategoryEntity> categories;
  final String searchQuery;

  const CategoryState({
    this.categories = const [],
    this.searchQuery = '',
  });

  CategoryState copyWith({
    List<CategoryEntity>? categories,
    String? searchQuery,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}