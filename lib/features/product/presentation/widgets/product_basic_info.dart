import 'package:flutter/material.dart';
import 'package:shop_app/features/category/domain/entity/category_entity.dart';
import 'package:shop_app/features/product/presentation/widgets/add_category_dialogue.dart';
import 'package:shop_app/features/product/presentation/widgets/category_drop_down.dart';

class ProductBasicInfo extends StatelessWidget {
  const ProductBasicInfo({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.isEdit,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final bool isEdit;

  final CategoryEntity? selectedCategory;

  final ValueChanged<CategoryEntity?> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: .5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isEdit ? "Edit Product" : "Add Product",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: FilledButton.icon(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => const AddCategoryDialog(),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: Text('Add Category'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Product Name *',
                        hintText: 'Enter product name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Product name is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CategoryDropDown(
                      onCategoryChanged: onCategoryChanged,
                      selectedCategory: selectedCategory,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
