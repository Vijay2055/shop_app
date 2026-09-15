import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/providers/usecase_providers.dart';

class GenerateSkuNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  Future<void> onGenerate() async {
    final result = await ref.read(generateSkuProvider)();
    switch (result) {
      case Success<String>(:final data):
        state = data;
      case FailureResult<String>(:var failure):
        print(failure.message);
        state = "";
    }
  }
}

final generateSkuNotifierProvider =
    NotifierProvider.autoDispose<GenerateSkuNotifier, String>(
      GenerateSkuNotifier.new,
    );
