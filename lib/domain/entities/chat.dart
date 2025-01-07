import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final int id;
  final int chatType;
  final String username;
  final String avatar;
  final String name;
  final String surname;
  final String msgText;
  final int unreadNum;
  final String updatedAt;
  final bool isSeen;
  final bool isOnline;

  const Chat({
    required this.id,
    required this.chatType,
    required this.username,
    required this.avatar,
    required this.name,
    required this.surname,
    required this.msgText,
    required this.unreadNum,
    required this.updatedAt,
    required this.isSeen,
    required this.isOnline,
  });

  @override
  List<Object?> get props => [id];
}

class ChatResponse {
  final List<Chat> chats;

  ChatResponse({required this.chats});
}

class FilterChatParams {
  const FilterChatParams();
}
