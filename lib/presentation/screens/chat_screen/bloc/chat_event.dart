part of 'chat_bloc.dart';

class ChatEvent extends Equatable {
  final ChatParams params;

  const ChatEvent(this.params);

  @override
  List<Object> get props => [];
}

class ChatUpdateNotifySettingsEvent extends ChatEvent {
  final Receiver receiver;

  const ChatUpdateNotifySettingsEvent(this.receiver, ChatParams params)
    : super(params);

  @override
  List<Object> get props => [receiver, params];
}
