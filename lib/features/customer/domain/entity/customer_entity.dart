import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_entity.freezed.dart';

@freezed
abstract class CustomerEntity with _$CustomerEntity {
  const factory CustomerEntity({
    required String id,

    required String name,

    String? phone,

    String? address,

    @Default(true) bool isActive,

    required DateTime createdAt,

    required DateTime updatedAt,
  }) = _CustomerEntity;
}