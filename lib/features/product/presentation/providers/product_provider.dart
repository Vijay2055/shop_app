import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/product/domain/entities/product.dart';
import 'package:shop_app/features/product/presentation/providers/product_notifier.dart';

final productNotifierProvider =
    AsyncNotifierProvider<ProductNotifier, List<Product>>(ProductNotifier.new);
