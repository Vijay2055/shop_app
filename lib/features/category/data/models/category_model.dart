import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart'; // Needed for JSON serialization

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    int? id,
    required String name,
    String? description,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CategoryModel;

  // 1. From JSON (Database -> Model)
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  // 2. From Entity (Domain Entity -> Model, ready for Database)
  factory CategoryModel.fromEntity(CategoryEntity entity) {
    final now = DateTime.now();
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,

      isActive: entity.isActive,
      createdAt: now,
      updatedAt: now,
    );
  }
}

// ==========================================
// ALL EXTENSIONS MUST LIVE INDEPENDENTLY AT THE ROOT LEVEL
// ==========================================

// 3. Extension to easily convert Model back to Entity
extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      description: description,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// 4. Extension to convert Drift's generated class to your Domain Entity
extension CategoryTableX on Category {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      description: description,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// 5. Extension to convert your Domain Entity into Drift's Companion for inserts/updates
extension CategoryEntityX on CategoryEntity {
  CategoriesCompanion toCompanion() {
    final now = DateTime.now();
    return CategoriesCompanion.insert(
      name: name,
      description: Value(description),
      isActive: Value(isActive),
      createdAt: now,
      updatedAt: now,
    );
  }
}
