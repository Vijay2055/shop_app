import 'package:drift/drift.dart';
import 'package:shop_app/core/database/app_database.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';

extension CustomerCompanionX on CustomerEntity {
  CustomersCompanion toCompanion() {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      address: Value(address),
      isActive: Value(isActive),
      createdAt: Value(createdAt.millisecondsSinceEpoch),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch),
    );
  }
}



extension CustomerModelX on Customer {
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      phone: phone,
      address: address,
      isActive: isActive,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}