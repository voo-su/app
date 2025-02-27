import 'package:flutter/material.dart';
import 'package:voo_su/core/utils/time_formatter.dart';

class MessageBubbleWidget extends StatelessWidget {
  final String message;
  final bool isMine;
  final String createdAt;
  final bool isRead;

  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.isMine,
    required this.createdAt,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMine ? colors.primary : colors.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isMine ? const Radius.circular(12) : const Radius.circular(0),
            bottomRight:
                isMine ? const Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: isMine ? 60 : 40),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: isMine ? colors.surface : colors.onSurface,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimeFormatterWidget(dateTime: createdAt, isMine: isMine),
                  const SizedBox(width: 4),
                  if (isMine)
                    Icon(
                      isRead ? Icons.done_all : Icons.check,
                      size: 16,
                      color: colors.surface,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
