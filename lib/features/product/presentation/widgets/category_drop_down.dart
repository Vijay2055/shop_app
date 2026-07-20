import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/presentation/providers/category_provider.dart';

class CategoryDropDown extends ConsumerWidget {
  const CategoryDropDown({
    super.key,
    required this.onCategoryChanged,
    required this.selectedCategory,
  });
  final int? selectedCategory;
  final ValueChanged<int?> onCategoryChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryProvider);
    return categoryState.when(
      data: (data) {
        return DropdownButtonFormField<int>(
          initialValue: selectedCategory,
          decoration: const InputDecoration(
            labelText: 'Category *',
            border: OutlineInputBorder(),
          ),
          items: data.categories.map((category) {
            return DropdownMenuItem(
              value: category.id,
              child: Text(category.name),
            );
          }).toList(),
          onChanged: onCategoryChanged,
          validator: (value) {
            if (value == null) {
              return 'Select category';
            }
            return null;
          },
        );
      },
      error: (errr, _) => Text(errr.toString()),
      loading: () => CircularProgressIndicator(),
    );
  }
}
