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
    required this.onGenerateBarcode,
    required this.onGenerateSKU
  });

  final TextEditingController skuController;
  final TextEditingController barcodeController;
  final TextEditingController colorController;
  final TextEditingController sizeController;

  final VoidCallback? onScanBarcode;
  final Function()? onGenerateBarcode;
  final Function()? onGenerateSKU;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Enter or generate the variant identification details.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─────────────────────────────────────────────
                // BARCODE
                // ─────────────────────────────────────────────
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
                      prefixIcon: const Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 21,
                      ),

                      // Generate button feels INSIDE the field.
                      suffixIcon: Container(
                        height: 30,
                        margin: const EdgeInsets.only(
                          right: 2,
                          top: 1,
                          bottom: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextButton.icon(
                          onPressed: onGenerateBarcode,
                          icon: const Icon(Icons.autorenew_rounded, size: 17),
                          label: Text(
                            barcodeController.text.trim().isEmpty
                                ? 'Generate'
                                : 'Regenerate',
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
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

                // ─────────────────────────────────────────────
                // SKU
                // ─────────────────────────────────────────────
                Expanded(
                  child: TextFormField(
                    controller: skuController,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      labelText: 'SKU *',
                      hintText: 'Ex: VI-583214',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.inventory_2_outlined,
                        size: 21,
                      ),

                      // Generate button feels INSIDE the field.
                      suffixIcon: Container(
                        height: 30,
                        margin: const EdgeInsets.only(
                          right: 2,
                          top: 1,
                          bottom: 1,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextButton.icon(
                          onPressed: onGenerateSKU,
                          icon: const Icon(Icons.autorenew_rounded, size: 17),
                          label: Text(
                            skuController.text.trim().isEmpty
                                ? 'Generate'
                                : 'Regenerate',
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
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

            // ─────────────────────────────────────────────
            // COLOR + VARIANT
            // ─────────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: colorController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Color',
                      hintText: 'Optional',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.palette_outlined, size: 21),
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
                      prefixIcon: Icon(Icons.category_outlined, size: 21),
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
