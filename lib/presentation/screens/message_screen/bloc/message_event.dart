part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class LoadHistoryEvent extends MessageEvent {
  final MessageParams params;

  const LoadHistoryEvent(this.params);

  @override
  List<Object> get props => [params];
}

class NewMessageEvent extends MessageEvent {
  final Message message;

  const NewMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteMessagesEvent extends MessageEvent {
  final DeleteMessagesParams params;

  const DeleteMessagesEvent(this.params);

  @override
  List<Object> get props => [params];
}

class SendMessagesEvent extends MessageEvent {
  final SendMessageParams params;

  const SendMessagesEvent(this.params);

  @override
  List<Object> get props => [params];
}

class LoadGroupInfoEvent extends MessageEvent {
  final int groupId;

  const LoadGroupInfoEvent(this.groupId);

  @override
  List<Object> get props => [groupId];
}

class SendMediaEvent extends MessageEvent {
  final Receiver receiver;
  final InputFile file;
  final String path;
  final String? message;
  final int? replyToMsgId;

  const SendMediaEvent({
    required this.receiver,
    required this.file,
    required this.path,

    this.message,
    this.replyToMsgId,
  });

  @override
  List<Object> get props => [receiver, file];
}
