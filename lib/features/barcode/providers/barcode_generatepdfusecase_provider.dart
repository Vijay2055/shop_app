import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/barcode/data/repositories/barcode_repositoryIml.dart';
import 'package:shop_app/features/barcode/domain/usecases/barcode_save_pdf_usecase.dart';
import 'package:shop_app/features/barcode/domain/usecases/print_barcode_usecase.dart';

final barcodePrintusecaseProvider = Provider((ref) {
  final repository = ref.read(barcodeRepositoryProvider);
  return barcodePrintUsecase(repository);
});

final barcodeSavePdfUsecaseProvider = Provider((ref) {
  final repository = ref.read(barcodeRepositoryProvider);
  return BarcodeSavePdfUsecase(repository);
});
