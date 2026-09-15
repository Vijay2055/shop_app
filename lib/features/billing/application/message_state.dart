class MessageState {
  final String message;
  final bool isError;

  const MessageState({this.message = '', this.isError = false});

  MessageState copyWith({String? message, bool? isError}) {
    return MessageState(
      message: message ?? this.message,
      isError: isError ?? this.isError,
    );
  }
}
