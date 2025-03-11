import 'package:flutter/material.dart';
import 'package:voo_su/core/utils/time_formatter.dart';
import 'package:voo_su/domain/entities/message.dart';

class MessageStatusWidget extends StatelessWidget {
  final Message message;
  final bool isMine;

  const MessageStatusWidget({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
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
    );
  }
}
