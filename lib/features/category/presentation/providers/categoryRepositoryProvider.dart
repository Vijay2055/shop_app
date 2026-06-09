import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/data/category_data_source.dart';
import 'package:shop_app/features/category/data/repository/category_repsotory_impl.dart';
import 'package:shop_app/features/product/presentation/providers/app_database_provider.dart';

final categoryDataSourceProvider = Provider((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CategoryLocalDataSource(db);
});

final categoryRepoProvider = Provider((ref) {
  final local = ref.watch(categoryDataSourceProvider);
  return CategoryRepositoryImpl(local);
});
