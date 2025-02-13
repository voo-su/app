import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String id;
  final int chatType;
  final int msgType;
  final int receiverId;
  final int userId;
  final String content;
  final bool isRead;
  final String createdAt;

  const Message({
    required this.id,
    required this.chatType,
    required this.msgType,
    required this.receiverId,
    required this.userId,
    required this.content,
    required this.isRead,
    required this.createdAt,
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
  final int recordId;
  final int limit;

  const MessageParams({
    required this.chatType,
    required this.receiverId,
    required this.recordId,
    required this.limit,
  });
}

class SendMessageParams {
  final int chatType;
  final int receiverId;
  final int recordId;
  final String message;

  const SendMessageParams({
    required this.chatType,
    required this.receiverId,
    required this.recordId,
    required this.message,
  });
}
