import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/chat_bloc.dart';
import 'package:frontend/chat_datasource.dart';
import 'package:frontend/chat_event.dart';
import 'package:frontend/chat_repository.dart';
import 'package:frontend/chat_state.dart';

void main() {
  group('Chat Bloc', () {
    late ChatBloc chatBloc;
    setUp(() {
      chatBloc = ChatBloc(
          chatRepositoryl: ChatRepository(chatDatasource: ChatDatasource()));
    });

    tearDown(() {
      chatBloc.close();
    });

    blocTest<ChatBloc, ChatState>(
      'emits [ChatLoaded] when SendMessageEvent is added',
      build: () => chatBloc,
      act: (bloc) => bloc.add(SendMessageEvent('Halo')),
      wait: const Duration(seconds: 3),
      expect: () => [
        isA<ChatLoaded>(),
        isA<ChatLoaded>(),
      ],
    );
  });
}
