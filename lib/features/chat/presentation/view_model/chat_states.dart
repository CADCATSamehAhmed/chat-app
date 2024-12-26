abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSending extends ChatState {}

class MessageSentSuccessed extends ChatState {}

class MessageSentFailed extends ChatState {
  final String error;
  MessageSentFailed(this.error);
}

class ChangeStateEmojiVisible extends ChatState {}
