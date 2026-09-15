import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/providers/usecase_providers.dart';



class GenerateBarcodeNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  Future<void> onGenerate() async {
    final result = await ref.read(generateBarcodeProvider)();
    switch (result) {
      case Success<String>(:final data):
        state = data;
      case FailureResult<String>(:var failure):
        print(failure.message);
        state = "";
    }
  }
}

final generateBarocdeNotifierProvider =
    NotifierProvider.autoDispose<GenerateBarcodeNotifier, String>(
      GenerateBarcodeNotifier.new,
    );
