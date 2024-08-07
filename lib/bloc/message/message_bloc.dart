// lib/bloc/message/message_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson92/models/message.dart';
import 'package:lesson92/models/sample_data.dart';

// Message Events
abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object?> get props => [];
}

class LoadMessages extends MessageEvent {
  final int contactId;
  const LoadMessages(this.contactId);

  @override
  List<Object?> get props => [contactId];
}

// Message States
abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object?> get props => [];
}

class MessagesInitial extends MessageState {}

class MessagesLoading extends MessageState {}

class MessagesLoaded extends MessageState {
  final List<Message> messages;
  const MessagesLoaded(this.messages);

  @override
  List<Object?> get props => [messages];
}

class MessagesError extends MessageState {}

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessagesInitial()) {
    // Register event handler
    on<LoadMessages>(_onLoadMessages);
  }

  // Event handler method
  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<MessageState> emit) async {
    emit(MessagesLoading());
    try {
      // Simulating data fetching delay
      await Future.delayed(Duration(seconds: 1));
      final contactMessages =
          sampleMessages.where((msg) => msg.contactId == event.contactId).toList();
      emit(MessagesLoaded(contactMessages));
    } catch (e) {
      emit(MessagesError());
    }
  }
}
