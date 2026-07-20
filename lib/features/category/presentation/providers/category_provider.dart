
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/presentation/providers/category_notifier.dart';
import 'package:shop_app/features/category/presentation/view_holder/category_state.dart';

final categoryProvider = AsyncNotifierProvider<CategoryNotifier, CategoryState>(
  CategoryNotifier.new,
);