import 'package:frontend/models/chat_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatModel> messages;

  ChatLoaded(this.messages);
}

class ChatError extends ChatState {
  final String message;
  final List<ChatModel> messages;

  ChatError(this.message, this.messages);
}
