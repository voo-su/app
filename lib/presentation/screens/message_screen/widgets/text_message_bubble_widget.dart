import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/base_message_bubble_widget.dart';

class TextMessageBubble extends StatelessWidget {
  final Message message;
  final bool isMine;

  const TextMessageBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMessageBubble(
      isMine: isMine,
      message: message,
      messageContent: Text(message.content),
    );
  }
}
