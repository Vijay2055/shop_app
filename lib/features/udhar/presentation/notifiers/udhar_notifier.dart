import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/udhar/data/models/udhar.dart';
import 'package:shop_app/features/udhar/data/models/udhar_summary_model.dart';
import 'package:shop_app/features/udhar/presentation/providers/udhar_repo_provider.dart';

class UdharNotifier extends AsyncNotifier<List<UdharSummaryModel>> {
  @override
  FutureOr<List<UdharSummaryModel>> build() async {
    final _repo = ref.read(udharRepositoryProvider);

    final result = await _repo.getAllUdhars();
    print(result.data);

    if (result.isSuccess) {
      return result.data ?? [];
    } else {
      throw Exception(result.error);
    }
  }

  Future<int?> addCustomer({
    required String name,
    required String phone,
    required String address,
  }) async {
    final _repo = ref.read(udharRepositoryProvider);
    final result = await _repo.addUdhar(
      Udhar(customerName: name, mobile: phone, address: address),
    );

    if (result.isSuccess) {
      final id = result.data!;

      // 🔥 refresh list after insert
      ref.invalidateSelf();

      return id;
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
      return null;
    }
  }
}
