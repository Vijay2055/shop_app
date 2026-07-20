import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:shop_app/features/barcode/presentation/providers/barcode_provider.dart';

class PdfPreviewScreen extends ConsumerWidget {
  final Uint8List pdfBytes;

  const PdfPreviewScreen({super.key, required this.pdfBytes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        elevation: 0,
        title: const Text("Barcode Labels Preview"),
        actions: [
          IconButton(
            tooltip: "Print",
            icon: const Icon(Icons.print),
            onPressed: () async {
              final message = await ref
                  .read(barcodeProvider.notifier)
                  .printBarcode();
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          ),
          IconButton(
            tooltip: "Download",
            icon: const Icon(Icons.download),
            onPressed: () async {
              final message = await ref
                  .read(barcodeProvider.notifier)
                  .saveBarcode();
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          ),
          IconButton(
            tooltip: "Share",
            icon: const Icon(Icons.share),
            onPressed: () async {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: PdfPreview(
            build: (format) async => pdfBytes,

            allowPrinting: false,
            allowSharing: false,

            canChangePageFormat: false,
            canChangeOrientation: false,

            canDebug: false,
            onError: (context, error) => Text("Can't  print pdf"),

            pdfFileName: "barcode_labels.pdf",
          ),
        ),
      ),
    );
  }
}
