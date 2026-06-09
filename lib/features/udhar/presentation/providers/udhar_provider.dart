import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/udhar/data/models/udhar_summary_model.dart';
import 'package:shop_app/features/udhar/presentation/notifiers/udhar_notifier.dart';

final udharNotifierProvider = AsyncNotifierProvider<UdharNotifier,List<UdharSummaryModel>>(UdharNotifier.new);