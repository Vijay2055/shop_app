import 'package:shop_app/features/cart/domain/entities/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final bool status;
  final bool isLoading;
  final String? message;

  const CartState({
    this.items = const [],
    this.status = false,
    this.isLoading = false,
    this.message,
  });

  /// Total after discount (actual selling price)
  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);

  /// Total MRP
  double get mrpTotal => items.fold(0, (sum, item) => sum + item.mrpTotal);

  /// Discount shown on bill
  double get totalDiscount => mrpTotal - totalAmount;

  double get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({
    List<CartItem>? items,
    bool? status,
    bool? isLoading,
    String? message,
  }) {
    return CartState(
      items: items ?? this.items,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}
