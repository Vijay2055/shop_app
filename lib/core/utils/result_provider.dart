import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ResultType {
  success,
  error,
  warning,
}

class ResultMessage {
  final String message;
  final ResultType type;

  const ResultMessage({
    required this.message,
    required this.type,
  });

  ResultMessage copyWith({
    String? message,
    ResultType? type,
  }) {
    return ResultMessage(
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }
}

class ResultNotifier extends Notifier<ResultMessage?> {
  @override
  ResultMessage? build() => null;

  void showSuccess(String message) {
    state = ResultMessage(
      message: message,
      type: ResultType.success,
    );
  }

  void showError(String message) {
    state = ResultMessage(
      message: message,
      type: ResultType.error,
    );
  }

  void showWarning(String message) {
    state = ResultMessage(
      message: message,
      type: ResultType.warning,
    );
  }

  void clear() {
    state = null;
  }
}

final resultProvider =
    NotifierProvider<ResultNotifier, ResultMessage?>(
  ResultNotifier.new,
);