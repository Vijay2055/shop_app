import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VariantPricingCard extends StatelessWidget {
  const VariantPricingCard({
    super.key,
    required this.costPriceController,
    required this.sellingPriceController,
    required this.mrpController,
    required this.vatController,
    required this.discountController,
  });

  final TextEditingController costPriceController;
  final TextEditingController sellingPriceController;
  final TextEditingController mrpController;
  final TextEditingController vatController;
  final TextEditingController discountController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: .5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pricing',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _NumberField(
                    controller: costPriceController,
                    label: 'Cost Price *',
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _NumberField(
                    controller: sellingPriceController,
                    label: 'Selling Price *',
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _NumberField(
                    controller: mrpController,
                    label: 'MRP *',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _NumberField(
                    controller: vatController,
                    label: 'VAT %',
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _NumberField(
                    controller: discountController,
                    label: 'Discount %',
                  ),
                ),

                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
      ],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (label.contains('*') && (value == null || value.trim().isEmpty)) {
          return 'Required';
        }

        return null;
      },
    );
  }
}
