import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VariantBasicInfo extends StatelessWidget {
  const VariantBasicInfo({
    super.key,
    required this.skuController,
    required this.barcodeController,
    required this.colorController,
    required this.sizeController,
    this.onScanBarcode,
  });

  final TextEditingController skuController;
  final TextEditingController barcodeController;
  final TextEditingController colorController;
  final TextEditingController sizeController;

  final VoidCallback? onScanBarcode;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: barcodeController,
                    autofocus: true,

                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      labelText: 'Barcode *',
                      hintText: 'Scan or enter barcode',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.qr_code_scanner),
                        tooltip: 'Scan Barcode',
                        onPressed: onScanBarcode,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Barcode is required';
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: TextFormField(
                    controller: skuController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'SKU *',
                      hintText: 'Ex: CC-250',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'SKU is required';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: colorController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Color',
                      hintText: 'Optional',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: TextFormField(
                    controller: sizeController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Variant',
                      hintText: '250ml / XL / 1kg',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
