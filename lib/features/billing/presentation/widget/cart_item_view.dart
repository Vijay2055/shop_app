import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';

class CartItemView extends ConsumerWidget {
  const CartItemView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Item",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(child: Text("Price", textAlign: TextAlign.center)),
                Expanded(child: Text("Qty", textAlign: TextAlign.center)),
                Expanded(child: Text("Total", textAlign: TextAlign.end)),
              ],
            ),
          ),

          const SizedBox(height: 6),

          /// 🔹 BODY
          Expanded(
            child: carts.items.isEmpty
                ? _emptyCart()
                : ListView.builder(
                    itemCount: carts.items.length,
                    itemBuilder: (context, index) {
                      final item = carts.items[index];
                      return _CartRow(item: item);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

Widget _emptyCart() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.8, end: 1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.scale(scale: value, child: child);
          },
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 60,
            color: Colors.grey.shade400,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Cart is empty",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

class _CartRow extends ConsumerStatefulWidget {
  final CartItem item;
  const _CartRow({required this.item});

  @override
  ConsumerState<_CartRow> createState() => _CartRowState();
}

class _CartRowState extends ConsumerState<_CartRow> {
  bool isHovered = false;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isTapped = true),
        onTapUp: (_) => setState(() => isTapped = false),
        onTapCancel: () => setState(() => isTapped = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            color: isTapped
                ? Colors.blue.withOpacity(0.08)
                : isHovered
                ? Colors.grey.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              /// Item
              Expanded(
                flex: 3,
                child: Text(
                  item.variant.variant,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              /// Price
              Expanded(
                child: Text(
                  "₹${item.variant.mrp}",
                  textAlign: TextAlign.center,
                ),
              ),

              /// Qty
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _modernQtyButton(Icons.remove, () {
                      ref
                          .read(cartProvider.notifier)
                          .decreaseQuantity(item.variant.id);
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(item.quantity.toString()),
                    ),
                    _modernQtyButton(Icons.add, () {
                      ref
                          .read(cartProvider.notifier)
                          .increaseQuantity(item.variant.id);
                    }),
                  ],
                ),
              ),

              /// Total
              Expanded(
                child: Text(
                  "₹${(item.mrpTotal).toStringAsFixed(2)}",
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _modernQtyButton(IconData icon, VoidCallback onTap) {
  return IconButton(
    onPressed: onTap,
    mouseCursor: SystemMouseCursors.click,
    icon: Icon(icon, size: 16),
    constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
    padding: EdgeInsets.zero,
    style: IconButton.styleFrom(
      backgroundColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    ),
  );
}
