part of 'chat_bloc.dart';

class ChatEvent extends Equatable {
  final ChatParams params;

  const ChatEvent(this.params);

  @override
  List<Object> get props => [];
}

class ChatUpdateNotifySettingsEvent extends ChatEvent {
  final int id;
  final int chatType;

  const ChatUpdateNotifySettingsEvent(this.id, this.chatType, ChatParams params)
    : super(params);

  @override
  List<Object> get props => [id, params];
}
