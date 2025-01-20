part of 'message_bloc.dart';

@immutable
abstract class MessageState extends Equatable {}

class InitialState extends MessageState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MessageState {
  @override
  List<Object> get props => [];
}

class SuccessState extends MessageState {
  final List<Message> messages;

  SuccessState({
    required this.messages,
  });

  @override
  List<Object> get props => [messages];
}

class ErrorState extends MessageState {
  final Failure failure;

  ErrorState({
    required this.failure,
  });

  @override
  List<Object> get props => [];
}
