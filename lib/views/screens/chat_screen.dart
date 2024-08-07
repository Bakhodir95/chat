// lib/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson92/bloc/message/message_bloc.dart';
import 'package:lesson92/models/contact.dart';


class ChatScreen extends StatelessWidget {
  final Contact contact;

  ChatScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    context.read<MessageBloc>().add(LoadMessages(contact.id));

    return Scaffold(
      appBar: AppBar(
        title: Text('${contact.name} ${contact.lastName}'),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state is MessagesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MessagesLoaded) {
            return ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                final message = state.messages[index];
                return ListTile(
                  title: Text(
                    message.isFile ? 'File: ${message.text}' : message.text,
                    style: TextStyle(
                      color: message.isFile ? Colors.blue : Colors.black,
                    ),
                  ),
                  subtitle: Text('Sent at: ${message.createdTime}'),
                );
              },
            );
          } else if (state is MessagesError) {
            return Center(child: Text('Failed to load messages'));
          } else {
            return Center(child: Text('No messages available'));
          }
        },
      ),
    );
  }
}
