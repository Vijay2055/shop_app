import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/product/presentation/providers/app_database_provider.dart';

final appInitProvider = FutureProvider<void>((ref) async {
  final db = ref.read(appDatabaseProvider);

  await db.initCounter();
});