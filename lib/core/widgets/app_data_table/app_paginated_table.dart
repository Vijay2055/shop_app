import 'package:flutter/material.dart';

class AppTablePagination extends StatelessWidget {
  const AppTablePagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  final int currentPage;
  final int totalPages;

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Page $currentPage of $totalPages',
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        const Spacer(),

        OutlinedButton.icon(
          onPressed: currentPage > 1 ? onPrevious : null,
          icon: const Icon(Icons.chevron_left),
          label: const Text('Previous'),
        ),

        const SizedBox(width: 12),

        FilledButton.icon(
          onPressed: currentPage < totalPages ? onNext : null,
          icon: const Icon(Icons.chevron_right),
          label: const Text('Next'),
        ),
      ],
    );
  }
}