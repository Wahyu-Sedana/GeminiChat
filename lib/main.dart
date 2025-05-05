import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/chat_bloc.dart';
import 'package:frontend/data/chat_datasource.dart';
import 'package:frontend/repositories/chat_repository.dart';
import 'package:frontend/views/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'views/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const ChatScreen(),
        ),
      ],
    );
    return BlocProvider(
      create: (context) => ChatBloc(
          chatRepositoryl: ChatRepository(
        chatDatasource: ChatDatasource(),
      )),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}
