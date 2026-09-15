import 'package:shop_app/features/category/domain/entity/category_entity.dart';

class ProductEntity {
  final String id;

  final CategoryEntity category;

  final String name;

  final String? description;

  final String? image;

  final bool isActive;

  final DateTime createdAt;

  final DateTime updatedAt;

  const ProductEntity({
    required this.id,
    required this.category,
    required this.name,
    this.description,
    this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}