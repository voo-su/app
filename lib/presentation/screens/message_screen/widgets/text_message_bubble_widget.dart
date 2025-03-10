import 'package:flutter/material.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/base_message_bubble_widget.dart';

class TextMessageBubble extends StatelessWidget {
  final String message;
  final bool isMine;
  final String createdAt;
  final bool isRead;

  const TextMessageBubble({
    super.key,
    required this.message,
    required this.isMine,
    required this.createdAt,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMessageBubble(
      isMine: isMine,
      createdAt: createdAt,
      isRead: isRead,
      message: message,
    );
  }
}
