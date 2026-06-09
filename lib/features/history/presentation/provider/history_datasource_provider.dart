import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/history/datasource/history_data.dart';
import 'package:shop_app/features/product/presentation/providers/app_database_provider.dart';

final historyDatasourceProvider = Provider<HistoryDatasource>((ref) {

  return HistoryDatasource(ref.read(appDatabaseProvider));
});
