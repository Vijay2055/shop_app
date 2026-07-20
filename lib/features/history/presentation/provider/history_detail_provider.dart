// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_app/features/history/data/models/history_detail_model.dart';
// import 'package:shop_app/features/history/presentation/provider/histroy_repository_provider.dart';

// final historyDetailProvider =
//     FutureProvider.family<HistoryDetailModel, String>((ref, id) async {
//   final repo = ref.read(historyRepositoryProvider);

//   final result = await repo.getHistoryDetail(id);

//   if (result.isSuccess && result.data != null) {
//     return result.data!;
//   }

//   throw result.error ?? Exception("Failed to load history detail");
// });