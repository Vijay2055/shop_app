import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedUdharNotifier extends Notifier<int?> {
  @override
  int? build() {
    return null; // initial value
  }

  void select(int id) {
    state = id;
  }

  void clear() {
    state = null;
  }
}

final selectedUdharProvider = NotifierProvider<SelectedUdharNotifier, int?>(
  SelectedUdharNotifier.new,
);
