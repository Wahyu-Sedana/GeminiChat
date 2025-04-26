import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/chat_model.dart';
import 'package:frontend/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final String apiUrl = 'http://localhost:3000/question';
  final ChatRepository chatRepositoryl;
  List<ChatModel> model = [];

  ChatBloc({required this.chatRepositoryl}) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    if (event.text.trim().isEmpty) return;

    model.add(ChatModel(role: "user", text: event.text));
    emit(ChatLoaded(List.from(model)));

    model.add(ChatModel(role: "bot", text: "..."));
    emit(ChatLoaded(List.from(model)));

    try {
      final answer = await chatRepositoryl.getAnswer(event.text);
      model.removeLast();
      model.add(ChatModel(role: "bot", text: answer));
      emit(ChatLoaded(List.from(model)));
    } catch (e) {
      model.removeLast();
      model.add(ChatModel(
          role: "bot", text: "Maaf, terjadi kesalahan. Coba lagi nanti."));
      emit(ChatError("Gagal mengirim pesan", List.from(model)));
    }
  }
}
