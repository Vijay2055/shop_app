import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/cart/service/product_inventory_system.dart';
import 'package:shop_app/features/product/presentation/providers/ripository_provider.dart';

final inventoryServiceProvider = Provider<InventoryService>((ref) {
  return InventoryService(ref.read(repositoryProvider));
});