import 'package:equatable/equatable.dart';
import 'package:voo_su/domain/entities/common.dart';

class Chat extends Equatable {
  final int id;
  final Receiver receiver;
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
    required this.receiver,
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

  Chat copyWith({
    int? id,
    Receiver? receiver,
    String? username,
    String? avatar,
    String? name,
    String? surname,
    String? msgText,
    int? unreadCount,
    String? updatedAt,
    bool? isOnline,
    bool? isDisturb,
    bool? isBot,
  }) {
    return Chat(
      id: id ?? this.id,
      receiver: receiver ?? this.receiver,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      msgText: msgText ?? this.msgText,
      unreadCount: unreadCount ?? this.unreadCount,
      updatedAt: updatedAt ?? this.updatedAt,
      isOnline: isOnline ?? this.isOnline,
      isDisturb: isDisturb ?? this.isDisturb,
      isBot: isBot ?? this.isBot,
    );
  }

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
