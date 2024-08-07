// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson92/views/screens/home_page.dart';
import 'bloc/contact/contact_bloc.dart';
import 'bloc/message/message_bloc.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc()..add(LoadContacts()),
        ),
        BlocProvider<MessageBloc>(
          create: (context) => MessageBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContactListScreen(),
      ),
    );
  }
}
