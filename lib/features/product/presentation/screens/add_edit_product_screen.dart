import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/product/domain/entities/product_entitiy.dart';
import 'package:shop_app/features/product/domain/entities/product_varient_draft.dart';
import 'package:shop_app/features/product/presentation/providers/add_product_provider.dart';
import 'package:shop_app/features/product/presentation/widgets/product_basic_info.dart';
import 'package:shop_app/features/product/presentation/widgets/product_bottom_bar.dart';
import 'package:shop_app/features/product/presentation/widgets/product_variant_table.dart';

class AddEditProductScreen extends ConsumerStatefulWidget {
  const AddEditProductScreen({super.key, this.product});
  final ProductEntity? product;

  @override
  ConsumerState<AddEditProductScreen> createState() =>
      _AddEditProductScreenState();
}

class _AddEditProductScreenState extends ConsumerState<AddEditProductScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    if (widget.product != null) {
      nameController.text = widget.product!.name;
      descriptionController.text = widget.product!.description ?? '';

      Future.microtask(() {
        ref
            .read(addProductNotifierProvider.notifier)
            .loadProduct(widget.product!.id);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.product != null;
    final state = ref.watch(addProductNotifierProvider);
    final addProduct = ref.read(addProductNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Update Product" : "Add Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductBasicInfo(
                  isEdit: isEdit,
                  nameController: nameController,
                  descriptionController: descriptionController,
                  selectedCategory: state.value?.selectedCategory,
                  onCategoryChanged: (value) {
                    if (value != null) {
                      addProduct.selectCategory(value);
                    }
                  },
                ),

                const SizedBox(height: 10),

                ProductVariantTable(
                  variants: state.value?.variants ?? [],
                  onDelete: (index) {
                    final variants = state.value?.variants ?? [];

                    addProduct.removeVariant(variants[index]);
                  },
                  onAddVariant: () async {
                    final ProductVariantDraft? variant = await context
                        .push<ProductVariantDraft>(Pages.addProductVariant);

                    if (variant != null) {
                      addProduct.addVariant(variant);
                    }
                  },
                  onItemTap: (productVariant) async {
                    final ProductVariantDraft? updatedVariant = await context
                        .push<ProductVariantDraft>(
                          Pages.addProductVariant,
                          extra: productVariant,
                        );

                    if (updatedVariant != null) {
                      addProduct.updateVariant(updatedVariant);
                    }
                  },
                ),
                const SizedBox(height: 20),

                ProductBottomBar(
                  title: isEdit ? "Update" : 'Save',
                  onCancel: () {
                    addProduct.clearForm();
                    Navigator.pop(context);
                  },
                  onSave: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    if ((state.value?.variants ?? []).isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please add at least one variant"),
                        ),
                      );
                      return;
                    }

                    final Result<void> result;

                    if (isEdit) {
                      result = await addProduct.updateProduct(
                        productId: widget.product!.id,
                        name: nameController.text.trim(),
                        description: descriptionController.text.trim(),
                      );
                    } else {
                      result = await addProduct.addProduct(
                        name: nameController.text.trim(),
                        description: descriptionController.text.trim(),
                      );
                    }

                    if (!context.mounted) return;

                    switch (result) {
                      case Success():
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isEdit
                                  ? "Product updated successfully"
                                  : "Product added successfully",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );

                        addProduct.clearForm();

                        context.pop();

                      case FailureResult(:final failure):
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(failure.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
