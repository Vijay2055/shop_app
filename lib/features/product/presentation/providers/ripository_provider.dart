import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/product/data/datasources/product_local_datasource.dart';
import 'package:shop_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:shop_app/features/product/presentation/providers/app_database_provider.dart';

final dataSourceProvider = Provider((ref) {
  final db = ref.watch(appDatabaseProvider);
  return ProductLocalDataSource(db);
});
final repositoryProvider = Provider((ref) {
  return ProductRepositoryImpl(ref.watch(dataSourceProvider));
});
