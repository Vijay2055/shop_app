import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/barcode/domain/barcode_item.dart';
import 'package:shop_app/features/barcode/presentation/view_states/barcode_state.dart';
import 'package:shop_app/features/product/domain/entities/product.dart';

final barcodeProvider = NotifierProvider<BarcodeNotifier, BarcodeState>(
  BarcodeNotifier.new,
);

class BarcodeNotifier extends Notifier<BarcodeState> {
  @override
  BarcodeState build() {
    return const BarcodeState();
  }

  void updateSearch(String value) {
    state = state.copyWith(searchQuery: value);
  }

  void toggleProduct(Product product) {
    final items = [...state.items];

    final index = items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      items.removeAt(index);
    } else {
      items.add(BarcodeItem(product: product, quantity: 1));
    }

    state = state.copyWith(items: items);
  }

  void clearSelection() {
    state = state.copyWith(items: []);
  }

  void selectAll(List<Product> products) {
    final items = products
        .map((product) => BarcodeItem(product: product, quantity: 1))
        .toList();

    state = state.copyWith(items: items);
  }

  void updateQuantity(int productId, int quantity) {
    final items = state.items.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(quantity: quantity < 1 ? 1 : quantity);
      }

      return item;
    }).toList();

    state = state.copyWith(items: items);
  }

  void increaseQuantity(String productId) {
    final items = state.items.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(quantity: item.quantity + 1);
      }

      return item;
    }).toList();

    state = state.copyWith(items: items);
  }

  void decreaseQuantity(String productId) {
    final items = state.items.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(
          quantity: item.quantity > 1 ? item.quantity - 1 : 1,
        );
      }

      return item;
    }).toList();

    state = state.copyWith(items: items);
  }

  bool isSelected(int productId) {
    return state.items.any((e) => e.product.id == productId);
  }

  int getQuantity(String productId) {
    final item = state.items.cast<BarcodeItem?>().firstWhere(
      (e) => e?.product.id == productId,
      orElse: () => null,
    );

    return item?.quantity ?? 1;
  }

  int get totalLabels {
    return state.items.fold(0, (sum, item) => sum + item.quantity);
  }

  void changeLayout(
  BarcodeLayout layout,
) {
  state = state.copyWith(
    layout: layout,
  );
}
}
