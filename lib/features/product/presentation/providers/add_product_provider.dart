import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/product/presentation/providers/add_product_notifier.dart';
import 'package:shop_app/features/product/presentation/state/add_product_state.dart';

final addProductNotifierProvider =
    AsyncNotifierProvider.autoDispose<AddProductNotifier, AddProductState>(
  AddProductNotifier.new,
);