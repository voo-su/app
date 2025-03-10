import 'package:flutter/material.dart';
import 'package:voo_su/core/utils/time_formatter.dart';
import 'package:voo_su/domain/entities/message.dart';

class BaseMessageBubble extends StatelessWidget {
  final Message message;
  final bool isMine;
  final Widget? replyContent;

  const BaseMessageBubble({
    super.key,
    required this.isMine,
    required this.message,
    this.replyContent,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMine ? colors.primary : colors.surfaceVariant,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isMine ? const Radius.circular(12) : const Radius.circular(0),
            bottomRight:
                isMine ? const Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (replyContent != null) ...[
              replyContent!,
              const SizedBox(height: 6),
            ],
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    message.content,
                    style: TextStyle(
                      fontSize: 16,
                      color: isMine ? colors.onPrimary : colors.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TimeFormatterWidget(dateTime: message.createdAt, isMine: isMine),
                    if (isMine) ...[
                      const SizedBox(width: 4),
                      Icon(
                        message.isRead ? Icons.done_all : Icons.done,
                        size: 16,
                        color: isMine ? colors.onPrimary : colors.onSurface,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
