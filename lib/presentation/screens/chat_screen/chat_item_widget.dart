import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/chat.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;

  const ChatItemWidget({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(chat.avatar),
                ),
                if (chat.isOnline)
                  const CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.red,
                  ),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(
                      fontWeight:
                          !chat.isSeen ? FontWeight.bold : FontWeight.w400,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${chat.msgText} - ${chat.updatedAt}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight:
                            !chat.isSeen ? FontWeight.bold : FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (chat.isSeen)
              CircleAvatar(
                radius: 8,
                backgroundImage: NetworkImage(chat.avatar),
              ),
          ],
        ),
      ),
    );
  }
}
