import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'message_state.dart';

class MessageNotifier extends Notifier<MessageState> {
  @override
  MessageState build() {
    return const MessageState();
  }

  void showSuccess(String message) {
    state = MessageState(message: message, isError: false);
  }

  void showError(String message) {
    state = MessageState(message: message, isError: true);
  }

  void clear() {
    state = const MessageState();
  }
}

final messageProvider = NotifierProvider<MessageNotifier, MessageState>(
  MessageNotifier.new,
);
