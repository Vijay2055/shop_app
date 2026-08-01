import 'package:shop_app/features/printer/models/printer_status.dart';

abstract class PrinterService {
  Future<List<String>> getInstalledPrinters();

  Future<String?> getDefaultPrinter();

  Future<PrinterStatus> getPrinterStatus(
    String printerName,
  );
}