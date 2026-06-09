import 'package:shop_app/features/cart/domain/entities/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final bool status;

  const CartState({this.items = const [], this.status = false});

  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);
  double get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({List<CartItem>? items, bool? status}) {
    return CartState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}
