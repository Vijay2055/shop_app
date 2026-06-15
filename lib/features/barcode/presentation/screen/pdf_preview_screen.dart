import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPreviewScreen extends StatelessWidget {
  final Uint8List pdfBytes;

  const PdfPreviewScreen({super.key, required this.pdfBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        elevation: 0,
        title: const Text("Barcode Labels Preview"),
        actions: [
          IconButton(
            tooltip: "Print",
            icon: const Icon(Icons.print),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Download",
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Share",
            icon: const Icon(Icons.share),
            onPressed: () {},
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

            allowPrinting: true,
            allowSharing: true,

            canChangePageFormat: false,
            canChangeOrientation: false,

            canDebug: false,

            pdfFileName: "barcode_labels.pdf",

            maxPageWidth: 900,
          ),
        ),
      ),
    );
  }
}
