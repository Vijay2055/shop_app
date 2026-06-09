import 'dart:async';
import 'dart:collection';
import 'package:shop_app/core/services/printer/enums/print_status.dart';
import 'package:shop_app/core/services/printer/models/print_job.dart';
import 'package:shop_app/core/services/printer/results/print_result.dart';
import 'package:shop_app/core/services/printer/services/printer_storage_service.dart';
import 'package:shop_app/core/services/printer/services/window_print_service.dart';

class PrintQueueService {
  final Queue<PrintJob> _queue = Queue();

  bool _isProcessing = false;

  final PrinterStorageService storageService;

  PrintQueueService({required this.storageService});

  Future<PrintResult> addJob(PrintJob job) async {
    _queue.add(job);

    _processQueue();
    return PrintResult(success: true, message: "Added to print queue");
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;

    _isProcessing = true;

    while (_queue.isNotEmpty) {
      final currentJob = _queue.first;

      try {
        final printerName = await storageService.getPrinter();

        if (printerName == null) {
          currentJob.status = PrintStatus.failed;
          print("No printer selected");

          await Future.delayed(const Duration(seconds: 5));
          continue;
        }

        final printer = WindowsPrintService(printerName);

        final available = printer.checkPrinterAvailable();

        if (!available) {
          print("Printer Offline. Retrying...");

          await Future.delayed(const Duration(seconds: 5));

          continue;
        }

        currentJob.status = PrintStatus.printing;

        final result = printer.printBytes(currentJob.bytes);

        if (result.success) {
          currentJob.status = PrintStatus.printed;

          print("Printed bill ${currentJob.billId}");

          _queue.removeFirst();
        } else {
          currentJob.status = PrintStatus.failed;

          await Future.delayed(const Duration(seconds: 5));
        }
      } catch (e) {
        print("Print Queue Error: $e");

        await Future.delayed(const Duration(seconds: 5));
      }
    }

    _isProcessing = false;
  }
}
