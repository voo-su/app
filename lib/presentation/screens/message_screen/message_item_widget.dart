import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/message.dart';

class MessageItemWidget extends StatelessWidget {
  final Message message;

  const MessageItemWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("message");
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              child: Column(
                children: [
                  Text(message.id),
                  Text(message.chatType.toString()),
                  Text(message.msgType.toString()),
                  Text(message.content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
