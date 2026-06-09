import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeView extends StatelessWidget {
  final String code;

  const BarcodeView({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BarcodeWidget(
        data: code,              // your barcode string
        barcode: Barcode.code128(),
        width: 250,
        height: 100,
      ),
    );
  }
}