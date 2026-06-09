import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/services/printer/services/print_queue_service.dart';
import 'package:shop_app/core/services/printer/services/printer_storage_service.dart';

final printerStorageProvider = Provider((ref) => PrinterStorageService());

final printQueueProvider = Provider(
  (ref) => PrintQueueService(storageService: ref.read(printerStorageProvider)),
);
