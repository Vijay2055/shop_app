import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/product/presentation/providers/product_notifier.dart';
import 'package:shop_app/features/product/presentation/state/product_state.dart';

final productNotifierProvider =
    AsyncNotifierProvider.autoDispose<ProductNotifier, ProductState>(
      ProductNotifier.new,
    );
