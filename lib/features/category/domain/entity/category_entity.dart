// category_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    int? id,
    required String name,
    String? description,

    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CategoryEntity;
}
