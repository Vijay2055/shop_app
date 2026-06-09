import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/cart/application/cart_state.dart';
import 'package:shop_app/features/cart/application/checkCartProfider.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';
import 'package:shop_app/features/product/presentation/providers/product_provider.dart';

class CartNotifier extends Notifier<CartState> {
  late final Ref _ref;

  @override
  CartState build() {
    _ref = ref;
    return const CartState();
  }

  // Future<bool> addToCart(CartItem item) async {
  //   final inventory = _ref.read(inventoryServiceProvider);

  //   final existingIndex = state.items.indexWhere(
  //     (e) => e.productId == item.productId,
  //   );

  //   final currentQty = existingIndex >= 0
  //       ? state.items[existingIndex].quantity
  //       : 0;

  //   final allowed = await inventory.canAddToCart(
  //     productBarcode: item.barcode,
  //     currentCartQty: currentQty,
  //   );

  //   if (!allowed) return false;

  //   if (existingIndex >= 0) {
  //     final updated = [...state.items];
  //     updated[existingIndex] = updated[existingIndex].copyWith(
  //       quantity: currentQty + 1,
  //     );

  //     state = state.copyWith(items: updated);
  //   } else {
  //     state = state.copyWith(items: [item, ...state.items]);
  //   }
  //   return true;
  // }

  void addToCart(CartItem item) {
    final productState = _ref.read(productNotifierProvider);

    final product = productState.maybeWhen(
      data: (products) => products.firstWhere((p) => p.id == item.productId),
      orElse: () => null,
    );

    if (product == null) return;

    final existingIndex = state.items.indexWhere(
      (e) => e.productId == item.productId,
    );

    final currentQty = existingIndex >= 0
        ? state.items[existingIndex].quantity
        : 0;

    final newQty = currentQty + 1;

    // 🚨 STOCK CHECK
    if (newQty > product.stock) {
      return; // block add
    }

    if (existingIndex >= 0) {
      final updated = [...state.items];
      final existing = updated[existingIndex];

      updated[existingIndex] = existing.copyWith(quantity: newQty);

      state = state.copyWith(items: updated);
    } else {
      state = state.copyWith(items: [item, ...state.items]);
    }
  }

  void removeItem(String productId) {
    state = state.copyWith(
      items: state.items.where((e) => e.productId != productId).toList(),
    );
  }

  void increaseQty(String productId) {
    final productState = _ref.read(productNotifierProvider);

    final product = productState.maybeWhen(
      data: (products) => products.firstWhere((p) => p.id == productId),
      orElse: () => null,
    );

    if (product == null) return;

    state = state.copyWith(
      items: state.items.map((e) {
        if (e.productId == productId) {
          if (e.quantity + 1 > product.stock) {
            return e; // block increase
          }
          return e.copyWith(quantity: e.quantity + 1);
        }
        return e;
      }).toList(),
    );
  }

  void decreaseQty(String productId) {
    final updated = <CartItem>[];
    for (final item in state.items) {
      if (productId == item.productId) {
        if (item.quantity > 1) {
          updated.add(item.copyWith(quantity: item.quantity - 1));
        }
      } else {
        updated.add(item);
      }
    }
    state = state.copyWith(items: updated);
  }

  void changeStatus(bool newStatus) {
    state = state.copyWith(status: newStatus);
  }

  void clearCart() {
    state = const CartState();
  }

  // Product? _getProduct(String productId) {
  //   final productState = _ref.watch(productNotifierProvider);
  //   return productState.when(
  //     data: (products) => products.firstWhere(
  //       (p) => p.id == productId,
  //       orElse: () => throw Exception("Product not found"),
  //     ),
  //     loading: () => null,
  //     error: (_, __) => null,
  //   );
  // }
}

final cartProvider = NotifierProvider<CartNotifier, CartState>(
  CartNotifier.new,
);
