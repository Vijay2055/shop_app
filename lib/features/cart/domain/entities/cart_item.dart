class CartItem {
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String barcode;

  const CartItem({
    required this.name,
    required this.price,
    required this.productId,
    required this.quantity,
    required this.barcode,
  });

  double get total => price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      name: name,
      price: price,
      productId: productId,
      quantity: quantity ?? this.quantity,
      barcode: barcode,
    );
  }
}
