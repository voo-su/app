import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int id;
  final int chatType;
  final int msgType;
  final int receiverId;
  final int userId;
  final String content;
  final bool isRead;
  final String createdAt;
  final MessageMediaPhoto? mediaPhoto;
  final MessageMediaDocument? mediaDocument;

  const Message({
    required this.id,
    required this.chatType,
    required this.msgType,
    required this.receiverId,
    required this.userId,
    required this.content,
    required this.isRead,
    required this.createdAt,
    this.mediaPhoto,
    this.mediaDocument,
  });

  @override
  List<Object?> get props => [id];
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

class MessageMediaPhoto {
  final String file;

  const MessageMediaPhoto({required this.file});
}

class MessageMediaDocument {
  final String file;
  final String mime;

  const MessageMediaDocument({required this.file, required this.mime});
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
