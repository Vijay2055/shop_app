import 'dart:ui';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/barcode/presentation/providers/barcode_provider.dart';
import 'package:shop_app/features/barcode/services/barcode_pdf_service.dart';

class BarcodePreviewScreen extends ConsumerWidget {
  const BarcodePreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(barcodeProvider);
    final notifier = ref.read(barcodeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Barcode Preview")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Select Barcode Size",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),

                          const Spacer(),

                          FilledButton.icon(
                            onPressed: () async {
                              final message = await notifier.saveBarcode();
                              if (!context.mounted) {
                                return;
                              }
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(message)));
                            },
                            icon: const Icon(Icons.picture_as_pdf),
                            label: const Text("Save PDF"),
                          ),

                          const SizedBox(width: 12),
                          OutlinedButton.icon(
                            onPressed: () async {
                              final service = BarcodePdfService();

                              final bytes = await service.generatePdf(
                                items: state.items,
                                layout: state.layout,
                              );

                              if (!context.mounted) return;

                              context.push(Pages.pdfPreview, extra: bytes);
                            },
                            icon: const Icon(Icons.visibility),
                            label: const Text("Preview"),
                          ),

                          const SizedBox(width: 12),

                          OutlinedButton.icon(
                            onPressed: state.items.isEmpty
                                ? null
                                : () async {
                                    final message = await notifier
                                        .printBarcode();
                                    if (!context.mounted) {
                                      return;
                                    }
                                    ScaffoldMessenger.of(
                                      context,
                                    ).clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)),
                                    );
                                  },
                            icon: const Icon(Icons.print),
                            label: const Text("Print"),
                          ),

                          const SizedBox(width: 12),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          const Text(
                            "Layout",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),

                          const SizedBox(width: 16),

                          ChoiceChip(
                            label: const Text("Single"),
                            selected: state.layout == BarcodeLayout.single,
                            onSelected: (_) {
                              notifier.changeLayout(BarcodeLayout.single);
                            },
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text("A4-12"),
                            selected: state.layout == BarcodeLayout.a4_12,
                            onSelected: (_) {
                              notifier.changeLayout(BarcodeLayout.a4_12);
                            },
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text("A4-24"),
                            selected: state.layout == BarcodeLayout.a4_24,
                            onSelected: (_) {
                              notifier.changeLayout(BarcodeLayout.a4_24);
                            },
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text("A4-30"),
                            selected: state.layout == BarcodeLayout.a4_30,
                            onSelected: (_) {
                              notifier.changeLayout(BarcodeLayout.a4_30);
                            },
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text("A4-48"),
                            selected: state.layout == BarcodeLayout.a4_48,
                            onSelected: (_) {
                              notifier.changeLayout(BarcodeLayout.a4_48);
                            },
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text("A4-80"),
                            selected: state.layout == BarcodeLayout.a4_80,
                            onSelected: (_) {
                              notifier.changeLayout(BarcodeLayout.a4_80);
                            },
                          ),

                          const Spacer(),

                          _InfoCard(
                            title: "Products",
                            value: "${state.items.length}",
                          ),

                          const SizedBox(width: 12),

                          _InfoCard(
                            title: "Labels",
                            value: "${notifier.totalLabels}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];

                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.product.variant,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                BarcodeWidget(
                                  barcode: Barcode.code128(),
                                  data: item.product.barcode,
                                  width: 180,
                                  height: 60,
                                  drawText: true,
                                ),

                                const SizedBox(height: 8),

                                Text("Qty : ${item.quantity}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (state.isLoading)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withOpacity(0.2),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Text(title),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
