import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/barcode/data/repositories/barcode_repositoryIml.dart';
import 'package:shop_app/features/barcode/domain/usecases/barcode_generate_pdf_usecase.dart';
import 'package:shop_app/features/barcode/domain/usecases/barcode_save_pdf_usecase.dart';

final barcodeGeneratePdfUsecaseProvider = Provider((ref) {
  final repository = ref.read(barcodeRepositoryProvider);
  return BarcodeGeneratePdfUsecase(repository);
});

final barcodeSavePdfUsecaseProvider = Provider((ref) {
  final repository = ref.read(barcodeRepositoryProvider);
  return BarcodeSavePdfUsecase(repository);
});