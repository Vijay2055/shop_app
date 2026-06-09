import 'package:shop_app/core/database/app_database.dart';

class CategoryWithCount {
  final Category category;
  int productCount;

  CategoryWithCount({
    required this.category,
    required this.productCount,
  });
}