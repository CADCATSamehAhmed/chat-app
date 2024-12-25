class MessageModel{
  late String senderId;
  late String receiverId;
  late String text;
  late dynamic timestamp;

  MessageModel(this.senderId,this.receiverId,this.text,this.timestamp);

  MessageModel.fromJson(Map<String, dynamic>? json, {data}) {
    senderId = json!['senderId'];
    receiverId = json['receiverId'];
    timestamp = json['timestamp'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': timestamp,
    };
  }
}