import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/barcode/presentation/view_states/barcode_generation_state.dart';
import 'package:shop_app/features/barcode/providers/barcode_generatepdfusecase_provider.dart';

class barcodeNotifier extends Notifier<BarcodeGenerationState> {
  @override
  build() {
    return BarcodeGenerationState(isLoading: false, items: []);
  }

  void savePdf(BarcodeLayout layout) async {
    state = BarcodeGenerationState(isLoading: true, items: state.items);

    // Perform PDF saving logic here
    // After saving, update the state accordingly
    final pdfData = await ref
        .read(barcodeGeneratePdfUsecaseProvider)
        .call(items: state.items, layout: layout);
    if (!pdfData.isSuccess) {
      state = BarcodeGenerationState(
        isLoading: false,
        items: state.items,
        error: pdfData.error?.message ?? "Failed to generate PDF",
      );
      return;
    }
    final fileName = "barcode_labels.pdf"; // Specify the desired file name
    final result = await ref
        .read(barcodeSavePdfUsecaseProvider)
        .call(
          pdfData: pdfData.data!,
          fileName: fileName,
        ); // Simulate saving PDF
    if (result.isSuccess) {
      state = BarcodeGenerationState(isLoading: false, items: state.items);
    } else {
      state = BarcodeGenerationState(
        isLoading: false,
        items: state.items,
        error: result.error?.message ?? "Failed to save PDF",
      );
    }
  }
}
