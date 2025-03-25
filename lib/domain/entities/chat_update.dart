import 'package:equatable/equatable.dart';
import 'package:voo_su/domain/entities/common.dart';
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
  final Receiver receiver;
  final String lastReadInboxMessageId;
  final int unreadCount;

  const UpdateChatReadInbox({
    required this.receiver,
    required this.lastReadInboxMessageId,
    required this.unreadCount,
  });

  @override
  List<Object?> get props => [receiver, lastReadInboxMessageId, unreadCount];
}

class UpdateUserTyping extends ChatUpdate {
  final Receiver receiver;
  final int userId;
  final bool isTyping;

  const UpdateUserTyping({
    required this.receiver,
    required this.userId,
    required this.isTyping,
  });

  @override
  List<Object?> get props => [receiver, userId, isTyping];
}
