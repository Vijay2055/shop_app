import 'package:shop_app/core/services/printer/results/print_result.dart';
import 'package:win32/win32.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

class WindowsPrintService {
  final String printerName;

  WindowsPrintService(this.printerName);

  /// CHECK IF PRINTER IS AVAILABLE
  bool checkPrinterAvailable() {
    final hPrinter = calloc<HANDLE>();

    final result = OpenPrinter(TEXT(printerName), hPrinter, nullptr);

    if (result == 0) {
      calloc.free(hPrinter);
      return false;
    }

    ClosePrinter(hPrinter.value);
    calloc.free(hPrinter);

    return true;
  }

  /// PRINT RAW BYTES
  PrintResult printBytes(List<int> bytes) {
  final hPrinter = calloc<HANDLE>();

  final opened = OpenPrinter(TEXT(printerName), hPrinter, nullptr);

  if (opened == 0) {
    calloc.free(hPrinter);
    return PrintResult(
      success: false,
      message: "Printer not found or offline",
    );
  }

  final docInfo = calloc<DOC_INFO_1>()
    ..ref.pDocName = TEXT('POS BILL')
    ..ref.pDatatype = TEXT('RAW');

  final startDocResult =
      StartDocPrinter(hPrinter.value, 1, docInfo.cast());

  if (startDocResult == 0) {
    ClosePrinter(hPrinter.value);
    calloc.free(hPrinter);
    calloc.free(docInfo);

    return PrintResult(
      success: false,
      message: "Failed to start print job",
    );
  }

  StartPagePrinter(hPrinter.value);

  final pBytes = calloc<Uint8>(bytes.length);

  for (int i = 0; i < bytes.length; i++) {
    pBytes[i] = bytes[i];
  }

  final written = calloc<DWORD>();

  final writeResult = WritePrinter(
    hPrinter.value,
    pBytes,
    bytes.length,
    written,
  );

  EndPagePrinter(hPrinter.value);
  EndDocPrinter(hPrinter.value);
  ClosePrinter(hPrinter.value);

  calloc.free(hPrinter);
  calloc.free(docInfo);
  calloc.free(pBytes);
  calloc.free(written);

  if (writeResult == 0) {
    return PrintResult(
      success: false,
      message: "Printer write failed",
    );
  }

  return PrintResult(
    success: true,
    message: "Printed successfully",
  );
}

}
