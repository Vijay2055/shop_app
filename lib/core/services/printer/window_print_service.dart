import 'package:win32/win32.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

class WindowsPrintService {
  final String printerName;

  WindowsPrintService(this.printerName);

  /// 🔥 CHECK PRINTER STATUS
  bool checkPrinterAvailable() {
    final hPrinter = calloc<HANDLE>();

    final result = OpenPrinter(TEXT(printerName), hPrinter, nullptr);

    if (result == 0) {
      calloc.free(hPrinter);
      return false;
    }

    calloc.free(hPrinter);
    return true;
  }

  /// 🔥 MAIN PRINT FUNCTION
  bool printBytes(List<int> bytes) {
    final hPrinter = calloc<HANDLE>();

    final opened = OpenPrinter(TEXT(printerName), hPrinter, nullptr);

    if (opened == 0) {
      calloc.free(hPrinter);
      return false;
    }

    final docInfo = calloc<DOC_INFO_1>()
      ..ref.pDocName = TEXT('POS BILL')
      ..ref.pDatatype = TEXT('RAW');

    StartDocPrinter(hPrinter.value, 1, docInfo.cast());
    StartPagePrinter(hPrinter.value);

    final pBytes = calloc<Uint8>(bytes.length);

    for (int i = 0; i < bytes.length; i++) {
      pBytes[i] = bytes[i];
    }

    final written = calloc<DWORD>();

    WritePrinter(hPrinter.value, pBytes, bytes.length, written);

    EndPagePrinter(hPrinter.value);
    EndDocPrinter(hPrinter.value);
    ClosePrinter(hPrinter.value);

    calloc.free(hPrinter);
    calloc.free(docInfo);
    calloc.free(pBytes);
    calloc.free(written);

    return true;
  }
}
