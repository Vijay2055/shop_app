import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/category/domain/models/category_with_count.dart';
import 'package:shop_app/features/category/presentation/providers/category_notifier.dart';

final categoryProvider =
    AsyncNotifierProvider<CategoryNotifier, List<CategoryWithCount>>(
      CategoryNotifier.new,
    );
