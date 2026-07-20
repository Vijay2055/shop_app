import 'package:flutter/material.dart';

class AppTableHeader extends StatelessWidget {
  const AppTableHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.searchHint = 'Search...',
    this.onSearchChanged,
    this.addButtonText,
    this.onAddPressed,
    this.leadingActions,
    this.trailingActions,
  });

  final String title;
  final String? subtitle;

  final String searchHint;
  final ValueChanged<String>? onSearchChanged;

  final String? addButtonText;
  final VoidCallback? onAddPressed;

  /// Widgets before the Add button
  final List<Widget>? trailingActions;

  /// Widgets below search
  final List<Widget>? leadingActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Title Row
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),

            const Spacer(),

            if (trailingActions != null)
              ...trailingActions!,

            if (onAddPressed != null)
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: FilledButton.icon(
                  onPressed: onAddPressed,
                  icon: const Icon(Icons.add),
                  label: Text(addButtonText ?? 'Add'),
                ),
              ),
          ],
        ),

        const SizedBox(height: 20),

        /// Search
        SizedBox(
          width: 350,
          child: TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: searchHint,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        if (leadingActions != null) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: leadingActions!,
          ),
        ],

        const SizedBox(height: 20),
      ],
    );
  }
}