// lib/contact_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson92/bloc/contact/contact_bloc.dart';
import 'chat_screen.dart';

class ContactListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ContactsLoaded) {
            return ListView.builder(
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                final contact = state.contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.imageUrl),
                  ),
                  title: Text('${contact.name} ${contact.lastName}'),
                  subtitle: Text(contact.isOnline
                      ? 'Online'
                      : 'Last seen: ${contact.lastOnlineTime}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(contact: contact),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is ContactsError) {
            return Center(child: Text('Failed to load contacts'));
          } else {
            return Center(child: Text('No contacts available'));
          }
        },
      ),
    );
  }
}
