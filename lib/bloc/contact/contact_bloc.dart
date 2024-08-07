// lib/bloc/contact/contact_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson92/models/contact.dart';
import 'package:lesson92/models/sample_data.dart';

// Contact Events
abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

class LoadContacts extends ContactEvent {}

// Contact States
abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactsInitial extends ContactState {}

class ContactsLoading extends ContactState {}

class ContactsLoaded extends ContactState {
  final List<Contact> contacts;
  const ContactsLoaded(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class ContactsError extends ContactState {}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactsInitial()) {
    // Register event handler
    on<LoadContacts>(_onLoadContacts);
  }

  // Event handler method
  Future<void> _onLoadContacts(
      LoadContacts event, Emitter<ContactState> emit) async {
    emit(ContactsLoading());
    try {
      // Simulating data fetching delay
      await Future.delayed(Duration(seconds: 1));
      emit(ContactsLoaded(sampleContacts)); // Use sample data
    } catch (e) {
      emit(ContactsError());
    }
  }
}
