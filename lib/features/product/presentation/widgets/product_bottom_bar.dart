import 'package:flutter/material.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({
    super.key,
    required this.onCancel,
    required this.onSave,
    this.loading = false,
    required this.title
  });

  final VoidCallback onCancel;
  final VoidCallback onSave;
  final bool loading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),

        OutlinedButton(
          onPressed: loading ? null : onCancel,
          child: const Text('Cancel'),
        ),

        const SizedBox(width: 12),

        FilledButton.icon(
          onPressed: loading ? null : onSave,
          icon: loading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.save),
          label: Text(loading ? 'Saving...' : title),
        ),
      ],
    );
  }
}
