class ProductEntity {
  final String id;

  final int categoryId;

  final String name;

  final String? description;

  final String? image;

  final bool isActive;

  final DateTime createdAt;

  final DateTime updatedAt;

  const ProductEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    this.description,
    this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}