import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/barcode/presentation/view_states/barcode_generation_state.dart';
import 'package:shop_app/features/barcode/providers/barcode_generatepdfusecase_provider.dart';

class BarcodeNotifier extends Notifier<BarcodeGenerationState> {
  @override
  build() {
    return BarcodeGenerationState(isLoading: false, items: []);
  }

  void savePdf(BarcodeLayout layout) async {
    state = BarcodeGenerationState(isLoading: true, items: state.items);

    // Perform PDF saving logic here
    // After saving, update the state accordingly
    final fileName = "barcode_labels.pdf"; // Specify the desired file name
    final saveResult = await ref.read(barcodeSavePdfUsecaseProvider)(
      items: state.items,
      layout: layout,
      fileName: fileName,
    );

    switch (saveResult) {
      case Success<String>(:final data):
        state = BarcodeGenerationState(
          isLoading: false,
          items: state.items,
          error: data,
        );
      case FailureResult<String>(:final failure):
        state = BarcodeGenerationState(
          isLoading: false,
          items: state.items,
          error: failure.message,
        );
    }
  }
}

final barcodeGeneratorProvider =
    NotifierProvider.autoDispose<BarcodeNotifier, BarcodeGenerationState>(
      BarcodeNotifier.new,
    );
