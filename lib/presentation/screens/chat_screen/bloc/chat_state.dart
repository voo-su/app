part of 'chat_bloc.dart';

@immutable
abstract class ChatState extends Equatable {}

class InitialState extends ChatState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ChatState {
  @override
  List<Object> get props => [];
}

class SuccessState extends ChatState {
  final List<Chat> chats;

  SuccessState({
    required this.chats
  });

  @override
  List<Object> get props => [chats];
}

class ErrorState extends ChatState {
  final Failure failure;

  ErrorState({
    required this.failure,
  });

  @override
  List<Object> get props => [];
}
