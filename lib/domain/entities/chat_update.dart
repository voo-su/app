import 'package:equatable/equatable.dart';
import 'package:voo_su/domain/entities/message.dart';

abstract class ChatUpdate extends Equatable {
  const ChatUpdate();

  @override
  List<Object?> get props => [];
}

class UpdateNewMessage extends ChatUpdate {
  final Message message;

  const UpdateNewMessage({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateChatReadInbox extends ChatUpdate {
  final int chatType;
  final int receiverId;
  final String lastReadInboxMessageId;
  final int unreadCount;

  const UpdateChatReadInbox({
    required this.chatType,
    required this.receiverId,
    required this.lastReadInboxMessageId,
    required this.unreadCount,
  });

  @override
  List<Object?> get props => [
    chatType,
    receiverId,
    lastReadInboxMessageId,
    unreadCount,
  ];
}

class UpdateUserTyping extends ChatUpdate {
  final int chatType;
  final int receiverId;
  final int userId;
  final bool isTyping;

  const UpdateUserTyping({
    required this.chatType,
    required this.receiverId,
    required this.userId,
    required this.isTyping,
  });

  @override
  List<Object?> get props => [chatType, receiverId, userId, isTyping];
}

class UploadedFile {
  final int id;
  final int parts;
  final String name;

  UploadedFile({required this.id, required this.parts, required this.name});
}
