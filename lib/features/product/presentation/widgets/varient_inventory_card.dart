import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VariantInventoryCard extends StatelessWidget {
  const VariantInventoryCard({
    super.key,
    required this.stockController,
    required this.minimumStockController,
    required this.isActive,
    required this.onActiveChanged,
  });

  final TextEditingController stockController;
  final TextEditingController minimumStockController;

  final bool isActive;
  final ValueChanged<bool> onActiveChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: .5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _IntegerField(
                    controller: stockController,
                    label: 'Stock *',
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _IntegerField(
                    controller: minimumStockController,
                    label: 'Minimum Stock *',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SwitchListTile(
              value: isActive,
              onChanged: onActiveChanged,
              title: const Text('Active Variant'),
              subtitle: const Text(
                'Inactive variants will not appear during billing.',
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}

class _IntegerField extends StatelessWidget {
  const _IntegerField({required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Required';
        }

        return null;
      },
    );
  }
}
