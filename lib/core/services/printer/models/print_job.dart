import 'package:shop_app/core/services/printer/enums/print_status.dart';

class PrintJob {
  final String billId;
  final List<int> bytes;

  PrintStatus status;

  PrintJob({
    required this.billId,
    required this.bytes,
    this.status = PrintStatus.pending,
  });
}
