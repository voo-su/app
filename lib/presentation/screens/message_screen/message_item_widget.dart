import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/message_bubble_widget.dart';

class MessageItemWidget extends StatelessWidget {
  final Message message;
  final int receiverId;

  const MessageItemWidget({
    super.key,
    required this.message,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMine = message.userId != receiverId;

    return MessageBubbleWidget(
      message: message.content,
      isMine: isMine,
      createdAt: message.createdAt,
      isRead: message.isRead,
    );
  }
}
