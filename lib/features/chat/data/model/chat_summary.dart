class ChatSummary {
  late String chatId;
  late List participants;
  late String? name;
  late String? image;
  late String? lastMessage;
  late dynamic lastMessageTime;

  ChatSummary(
      this.chatId,
      this.participants,
      this.name,
      this.image,
      this.lastMessage,
      this.lastMessageTime,
      );

  ChatSummary.fromJson(
      Map<String, dynamic>? json,
      String? chatName,
      String? chatImage,
      String? chatLastMessage,
      String? chatLastMessageDate,
      ){
    chatId = json!['chatId'];
    participants = json['participants'];
    name=chatName;
    image=chatImage;
    lastMessage=chatLastMessage;
    lastMessageTime=chatLastMessageDate;
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'participants': participants,
    };
  }
}
