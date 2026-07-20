import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/features/product/domain/entities/product_varient_draft.dart';
import 'package:shop_app/features/product/presentation/widgets/variant_basic_info.dart';
import 'package:shop_app/features/product/presentation/widgets/variant_bottom_bar.dart';
import 'package:shop_app/features/product/presentation/widgets/variant_pricing_card.dart';
import 'package:shop_app/features/product/presentation/widgets/varient_inventory_card.dart';

class AddVariantScreen extends StatefulWidget {
  const AddVariantScreen({super.key, required this.variantDraft});

  final ProductVariantDraft? variantDraft;

  @override
  State<AddVariantScreen> createState() => _AddVariantScreenState();
}

class _AddVariantScreenState extends State<AddVariantScreen> {
  final _formKey = GlobalKey<FormState>();

  /// Basic
  final skuController = TextEditingController();
  final barcodeController = TextEditingController();
  final colorController = TextEditingController();
  final sizeController = TextEditingController();

  /// Pricing
  final costPriceController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final mrpController = TextEditingController();
  final vatController = TextEditingController(text: "0");
  final discountController = TextEditingController(text: "0");

  /// Inventory
  final stockController = TextEditingController(text: "0");
  final minimumStockController = TextEditingController(text: "0");

  bool isActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.variantDraft != null) {
      skuController.text = widget.variantDraft!.sku;
      barcodeController.text = widget.variantDraft!.barcode;
      colorController.text = widget.variantDraft!.color ?? "";
      sizeController.text = widget.variantDraft!.size ?? '';

      costPriceController.text = widget.variantDraft!.costPrice.toString();
      sellingPriceController.text = widget.variantDraft!.sellingPrice
          .toString();
      mrpController.text = widget.variantDraft!.mrp.toString();
      vatController.text = widget.variantDraft!.vatPercent.toString();
      discountController.text = widget.variantDraft!.discountPercent.toString();

      stockController.text = widget.variantDraft!.stock.toString();
      minimumStockController.text = widget.variantDraft!.minimumStock
          .toString();
    }
  }

  @override
  void dispose() {
    skuController.dispose();
    barcodeController.dispose();
    colorController.dispose();
    sizeController.dispose();

    costPriceController.dispose();
    sellingPriceController.dispose();
    mrpController.dispose();
    vatController.dispose();
    discountController.dispose();

    stockController.dispose();
    minimumStockController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Variant")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 950),
              child: Column(
                children: [
                  VariantBasicInfo(
                    skuController: skuController,
                    barcodeController: barcodeController,
                    colorController: colorController,
                    sizeController: sizeController,
                  ),

                  const SizedBox(height: 20),

                  VariantPricingCard(
                    costPriceController: costPriceController,
                    sellingPriceController: sellingPriceController,
                    mrpController: mrpController,
                    vatController: vatController,
                    discountController: discountController,
                  ),

                  const SizedBox(height: 20),

                  VariantInventoryCard(
                    stockController: stockController,
                    minimumStockController: minimumStockController,
                    isActive: isActive,
                    onActiveChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  VariantBottomBar(
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    onSave: _saveVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveVariant() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final variant = ProductVariantDraft(
      id: widget.variantDraft?.id,
      sku: skuController.text.trim(),
      barcode: barcodeController.text.trim(),
      color: colorController.text.trim().isEmpty
          ? null
          : colorController.text.trim(),
      size: sizeController.text.trim().isEmpty
          ? null
          : sizeController.text.trim(),
      costPrice: double.parse(costPriceController.text),
      sellingPrice: double.parse(sellingPriceController.text),
      mrp: double.parse(mrpController.text),
      vatPercent: double.tryParse(vatController.text) ?? 0,
      discountPercent: double.tryParse(discountController.text) ?? 0,
      stock: int.parse(stockController.text),
      minimumStock: int.parse(minimumStockController.text),
      isActive: isActive,
    );

    context.pop(variant);
  }

  /// Part 2
}
