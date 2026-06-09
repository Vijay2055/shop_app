import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/history/presentation/provider/history_datasource_provider.dart';
import 'package:shop_app/features/udhar/data/repository/udhar_repository_impl.dart';

final udharRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(historyDatasourceProvider);
  return UdharRepositoryImpl(dataSource);
});