import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';


part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,

    @JsonKey(name: 'category_id')
    required int categoryId,

    required String name,

    String? description,

    String? image,

    @JsonKey(name: 'is_active')
    @Default(true)
    bool isActive,

    @JsonKey(name: 'created_at')
    required DateTime createdAt,

    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      categoryId: entity.categoryId,
      name: entity.name,
      description: entity.description,
      image: entity.image,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}


/// Model -> Entity
extension ProductModelToEntity on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      image: image,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Drift Row -> Model
extension ProductRowToModel on Product {
  ProductModel toModel() {
    return ProductModel(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      image: image,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Model -> Companion (Insert)
extension ProductModelToCompanion on ProductModel {
  ProductsCompanion toCompanion() {
    return ProductsCompanion.insert(
      id: id,
      categoryId: categoryId,
      name: name,
      description: Value(description),
      image: Value(image),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}

/// Model -> Drift Row (Update)
extension ProductModelToDrift on ProductModel {
  Product toDrift() {
    return Product(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      image: image,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}



