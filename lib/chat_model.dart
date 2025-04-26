class ChatModel {
  final String role;
  final String text;

  ChatModel({required this.role, required this.text});

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      role: map['role'],
      text: map['text'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'text': text,
    };
  }
}
