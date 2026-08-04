import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/result.dart';
import 'package:shop_app/features/billing/application/message_notifier.dart';
import 'package:shop_app/features/cart/application/cart_state.dart';
import 'package:shop_app/features/cart/domain/entities/cart_item.dart';
import 'package:shop_app/features/product/domain/entities/product_variant_entity.dart';
import 'package:shop_app/features/product/providers/usecase_providers.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return const CartState();
  }

  Future<void> searchByBarcode(String barcode) async {
    state = state.copyWith(message: null);
    final existingIndex = state.items.indexWhere(
      (e) => e.variant.barcode == barcode,
    );

    if (existingIndex != -1) {
      final item = state.items[existingIndex];
      final newQty = item.quantity + 1;

      if (newQty > item.variant.stock) {
        state = state.copyWith(
          message:
              "${item.variant.variant} can't be more than ${item.variant.stock}",
        );

        ref
            .read(messageProvider.notifier)
            .showError(
              "${item.variant.variant} stock limit reached (${item.variant.stock})",
            );

        return;
      }

      final items = [...state.items];
      items[existingIndex] = item.copyWith(quantity: newQty);

      state = state.copyWith(items: items, message: null);
      return;
    }

    final result = await ref.read(getProductVariantByBarcodeUsecaseProvider)(
      barcode,
    );

    switch (result) {
      case Success<ProductVariantEntity>(:final data):
        state = state.copyWith(
          items: [
            CartItem(quantity: 1, variant: data),
            ...state.items,
          ],
          message: null,
        );
        break;

      case FailureResult<ProductVariantEntity>(:final failure):
        state = state.copyWith(message: failure.message);
        ref.read(messageProvider.notifier).showError(failure.message);
        break;
    }
  }

  void increaseQuantity(String productId) {
    final index = state.items.indexWhere((e) => e.variant.id == productId);

    if (index == -1) return;

    final item = state.items[index];

    if (item.quantity >= item.variant.stock) {
      state = state.copyWith(
        message:
            "${item.variant.variant} stock limit reached (${item.variant.stock})",
      );
      ref
          .read(messageProvider.notifier)
          .showError(
            "${item.variant.variant} stock limit reached (${item.variant.stock})",
          );
      return;
    }

    final items = [...state.items];
    items[index] = item.copyWith(quantity: item.quantity + 1);

    state = state.copyWith(items: items, message: null);
  }

  void decreaseQuantity(String producId) {
    final index = state.items.indexWhere((e) => e.variant.id == producId);

    if (index == -1) return;

    final item = state.items[index];

    if (item.quantity == 1) {
      final items = [...state.items]..removeAt(index);

      state = state.copyWith(items: items);
      return;
    }

    final items = [...state.items];
    items[index] = item.copyWith(quantity: item.quantity - 1);

    state = state.copyWith(items: items);
  }

  void removeItem(String productId) {
    state = state.copyWith(
      items: state.items.where((e) => e.variant.id != productId).toList(),
    );
  }

  void clearCart() {
    state = const CartState();
  }

  void clearMessage() {
    state = state.copyWith(message: null);
  }
}

final cartProvider = NotifierProvider.autoDispose<CartNotifier, CartState>(
  CartNotifier.new,
);
