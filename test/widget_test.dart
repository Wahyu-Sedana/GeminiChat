import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/data/chat_datasource.dart';
import 'package:frontend/repositories/chat_repository.dart';
import 'package:frontend/views/chat_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/chat_bloc.dart';

void main() {
  testWidgets('ChatScreen should display AppBar title',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => ChatBloc(
              chatRepositoryl:
                  ChatRepository(chatDatasource: ChatDatasource())),
          child: const ChatScreen(),
        ),
      ),
    );

    expect(find.text('ChatBot Wisata'), findsOneWidget);
  });
}
