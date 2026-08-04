import 'package:shop_app/features/homepage/data/dto/revenue_point_dto.dart';
import 'package:shop_app/features/homepage/domain/entity/revenue_point_enity.dart';

extension RevenuePointMapper on RevenuePointDto {
  RevenuePointEntity toEntity() {
    return RevenuePointEntity(
      date: date,
      revenue: revenue,
    );
  }
}