import 'package:equatable/equatable.dart';
import 'package:voo_su/domain/entities/common.dart';

class Message extends Equatable {
  final int id;
  final Receiver receiver;
  final int msgType;
  final int userId;
  final String content;
  final MessageReply? reply;
  final MessageMedia? media;
  final bool isRead;
  final String createdAt;

  const Message({
    required this.id,
    required this.receiver,
    required this.msgType,
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
  final Receiver receiver;
  final int messageId;
  final int limit;

  const MessageParams({
    required this.receiver,
    required this.messageId,
    required this.limit,
  });
}

class SendMessageParams {
  final Receiver receiver;
  final int messageId;
  final String message;
  final int? replyToMsgId;

  const SendMessageParams({
    required this.receiver,
    required this.messageId,
    required this.message,
    this.replyToMsgId,
  });
}

class DeleteMessagesParams {
  final Receiver receiver;
  final List<int> messageIds;

  const DeleteMessagesParams({
    required this.receiver,
    required this.messageIds,
  });
}

class Media {
  final String fileType;
  final String? mimeType;
  final String? fileName;
  final int? duration;
  final int? width;
  final int? height;

  Media({
    required this.fileType,
    this.mimeType,
    this.fileName,
    this.duration,
    this.width,
    this.height,
  });
}

class SendMediaParams {
  final Receiver receiver;
  final InputFile file;
  final Media media;
  final String? message;
  final int? replyToMsgId;

  SendMediaParams({
    required this.receiver,
    required this.file,
    required this.media,
    this.message,
    this.replyToMsgId,
  });
}
