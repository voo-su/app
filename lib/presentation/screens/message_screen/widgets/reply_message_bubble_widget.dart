import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/base_message_bubble_widget.dart';

class ReplyMessageBubble extends StatelessWidget {
  final Message message;
  final bool isMine;
  final String replyUser;

  const ReplyMessageBubble({
    super.key,
    required this.message,
    required this.isMine,
    required this.replyUser,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BaseMessageBubble(
      isMine: isMine,
      message: message,
      replyContent: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              replyUser,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ),
            Text(
              message.content,
              style: TextStyle(fontSize: 14, color: colors.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
