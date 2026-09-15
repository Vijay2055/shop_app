import 'package:flutter/material.dart';

class VariantBottomBar extends StatelessWidget {
  const VariantBottomBar({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton.icon(
            onPressed: onCancel,
            icon: const Icon(Icons.close),
            label: const Text('Cancel'),
          ),

          const SizedBox(width: 16),

          FilledButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.check),
            label: const Text('Add Variant'),
          ),
        ],
      ),
    );
  }
}
