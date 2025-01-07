part of 'chat_bloc.dart';

@immutable
abstract class ChatState extends Equatable {}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoaded extends ChatState {
  final List<Chat> chats;
  final FilterChatParams params;

  ChatLoaded({
    required this.chats,
    required this.params,
  });

  @override
  List<Object> get props => [chats, params];
}

class ChatError extends ChatState {
  final Failure failure;

  ChatError({
    required this.failure,
  });

  @override
  List<Object> get props => [];
}
