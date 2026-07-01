import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/database/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  
  // Clean up the database connection if the provider is ever destroyed
  ref.onDispose(() async {
    await database.close();
  });

  return database;
});