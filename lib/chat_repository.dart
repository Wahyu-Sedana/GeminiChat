import 'package:frontend/chat_datasource.dart';

class ChatRepository {
  final ChatDatasource chatDatasource;
  ChatRepository({required this.chatDatasource});

  Future<String> getAnswer(String text) async {
    return await chatDatasource.fetchAnswer(text);
  }
}
