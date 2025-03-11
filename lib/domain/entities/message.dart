import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int id;
  final int chatType;
  final int msgType;
  final int receiverId;
  final int userId;
  final String content;
  final MessageReply? reply;
  final MessageMedia? media;
  final bool isRead;
  final String createdAt;

  const Message({
    required this.id,
    required this.chatType,
    required this.msgType,
    required this.receiverId,
    required this.userId,
    required this.content,
    this.media,
    this.reply,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id];
}

class MessageReply {
  final int id;
  final int msgType;
  final int userId;
  final String username;
  final String content;

  MessageReply({
    required this.id,
    required this.msgType,
    required this.userId,
    required this.username,
    required this.content,
  });
}

abstract class MessageMedia {}

class MessageMediaPhoto extends MessageMedia {
  final String file;

  MessageMediaPhoto(this.file);
}

class MessageMediaDocument extends MessageMedia {
  final String file;
  final String mime;

  MessageMediaDocument(this.file, this.mime);
}

class MessageResponse {
  final List<Message> messages;

  MessageResponse({required this.messages});
}

class MessageParams {
  final int chatType;
  final int receiverId;
  final int messageId;
  final int limit;

  const MessageParams({
    required this.chatType,
    required this.receiverId,
    required this.messageId,
    required this.limit,
  });
}

class SendMessageParams {
  final int chatType;
  final int receiverId;
  final int messageId;
  final String message;
  final int? replyToMsgId;

  const SendMessageParams({
    required this.chatType,
    required this.receiverId,
    required this.messageId,
    required this.message,
    this.replyToMsgId,
  });
}

class DeleteMessagesParams {
  final int chatType;
  final int receiverId;
  final List<int> messageIds;

  const DeleteMessagesParams({
    required this.chatType,
    required this.receiverId,
    required this.messageIds,
  });
}
