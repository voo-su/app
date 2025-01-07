part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class Chats extends ChatEvent {
  final FilterChatParams params;

  const Chats(this.params);

  @override
  List<Object> get props => [];
}
