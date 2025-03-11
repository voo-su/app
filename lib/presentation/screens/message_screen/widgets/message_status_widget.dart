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
            Icons.done_all,
            size: 16,
            color: message.isRead ? Colors.blue[700] : colors.surface,
          ),
        ],
      ],
    );
  }
}
