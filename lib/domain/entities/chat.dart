import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final int id;
  final int chatType;
  final int receiverId;
  final String username;
  final String avatar;
  final String name;
  final String surname;
  final String msgText;
  final int unreadCount;
  final String updatedAt;
  final bool isOnline;
  final bool isDisturb;
  final bool isBot;

  const Chat({
    required this.id,
    required this.chatType,
    required this.receiverId,
    required this.username,
    required this.avatar,
    required this.name,
    required this.surname,
    required this.msgText,
    required this.unreadCount,
    required this.updatedAt,
    required this.isOnline,
    required this.isDisturb,
    required this.isBot,
  });

  @override
  List<Object?> get props => [id];
}

class ChatResponse {
  final List<Chat> chats;

  ChatResponse({required this.chats});
}

class ChatParams {
  const ChatParams();
}

class GroupChatParams extends Equatable {
  final int id;

  const GroupChatParams({required this.id});

  @override
  List<Object?> get props => [id];
}

