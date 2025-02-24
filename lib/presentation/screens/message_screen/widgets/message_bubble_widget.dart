import 'package:flutter/material.dart';
import 'package:voo_su/core/theme/colors.dart';
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
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMine ? AppColors.lightPrimary : Colors.white,
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
              padding: const EdgeInsets.only(right: 60),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: isMine ? Colors.white : Colors.black,
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
                  Icon(
                    isRead ? Icons.done_all : Icons.check,
                    size: 16,
                    color: isMine == true ? Colors.white : Colors.black,
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
