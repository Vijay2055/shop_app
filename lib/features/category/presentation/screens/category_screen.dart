import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/core/utils/popup/add_product_dialogue.dart';
import 'package:shop_app/features/category/presentation/providers/category_provider.dart';
import 'package:shop_app/features/product/presentation/providers/search_provider.dart';
import 'package:shop_app/features/product/presentation/providers/selectedCategoryProvider.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryProvider);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ================= HEADER =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Category Overview",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              ElevatedButton.icon(
                onPressed: () => _showAddCategoryDialog(context, ref),
                icon: const Icon(Icons.add),
                label: const Text("Add Category"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// ================= QUICK STATS =================
          state.when(
            data: (categories) {
              final totalProducts = categories.fold<int>(
                0,
                (sum, c) => sum + c.productCount,
              );

              return Row(
                children: [
                  _statCard(
                    title: "Categories",
                    value: "${categories.length}",
                    icon: Icons.category,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 16),
                  _statCard(
                    title: "Total Products",
                    value: "$totalProducts",
                    icon: Icons.inventory,
                    color: Colors.blue,
                  ),
                  // const SizedBox(width: 16),
                  // _statCard(
                  //   title: "Active Stock",
                  //   value: "Live",
                  //   icon: Icons.check_circle,
                  //   color: Colors.green,
                  // ),
                ],
              );
            },
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Text("$e"),
          ),

          const SizedBox(height: 24),

          /// ================= CATEGORY LIST =================
          Expanded(
            child: state.when(
              data: (categories) {
                return GridView.builder(
                  itemCount: categories.length + 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _actionTile(
                        title: "View All Products",
                        icon: Icons.dashboard,
                        color: Colors.blue,
                        onTap: () {
                          ref.read(searchProvider.notifier).clear();
                          ref.read(selectedCategoryProvider.notifier).clear();
                          context.push(Pages.product);
                        },
                      );
                    }

                    if (index == 1) {
                      return _actionTile(
                        title: "Add Product",
                        icon: Icons.add,
                        color: Colors.green,
                        onTap: () => showAddDialog(context, ref),
                      );
                    }

                    final category = categories[index - 2];

                    return _categoryTile(
                      name: category.category.name,
                      count: category.productCount,
                      onTap: () {
                        ref.read(searchProvider.notifier).clear();
                        ref
                            .read(selectedCategoryProvider.notifier)
                            .update(category.category.id);
                        context.push(
                          Pages.product,
                          extra: category.category.id,
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text("$e")),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= STATS CARD =================
  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(title, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ================= CATEGORY TILE =================
  Widget _categoryTile({
    required String name,
    required int count,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.category, color: Colors.orange),
            const SizedBox(height: 10),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              "$count items",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= ACTION TILE =================
  Widget _actionTile({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color, color.withOpacity(0.6)]),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Category"),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(categoryProvider.notifier).addCategory(controller.text);

              context.pop();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
