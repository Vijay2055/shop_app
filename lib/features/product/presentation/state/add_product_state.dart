import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/product/domain/entities/product_varient_draft.dart';

class AddProductState {
  final String name;

  final String description;

  final CategoryEntity? selectedCategory;

  final List<ProductVariantDraft> variants;

  final bool isSaving;

  final String? error;

  const AddProductState({
    this.name = '',
    this.description = '',
    this.selectedCategory,
    this.variants = const [],
    this.isSaving = false,
    this.error,
  });

  AddProductState copyWith({
    String? name,
    String? description,
    CategoryEntity? selectedCategory,
    List<ProductVariantDraft>? variants,
    bool? isSaving,
    String? error,
  }) {
    return AddProductState(
      name: name ?? this.name,
      description: description ?? this.description,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      variants: variants ?? this.variants,
      isSaving: isSaving ?? this.isSaving,
      error: error,
    );
  }
}