import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/presentation/screens/message_screen/message_screen.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;

  const ChatItemWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String formattedTime = _formatDateOrTime(chat.updatedAt);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessageScreen(chat: chat)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: size.height * 0.08,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  AvatarWidget(
                    avatarUrl: chat.avatar,
                    name: chat.name,
                    surname: chat.surname,
                    username: chat.username,
                    isOnline: chat.isOnline,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.name,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.lightOnSurface20,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.lightOnSurface40,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.msgText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.darkOnSurface60,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        if (chat.unreadCount > 0)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7.5,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightPrimary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              chat.unreadCount > 99
                                  ? "99+"
                                  : chat.unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateOrTime(String dateTime) {
    try {
      final DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");
      final DateTime parsedDate = format.parse(dateTime);
      final DateTime now = DateTime.now();

      final Duration difference = now.difference(parsedDate);

      if (difference.inHours < 24 && parsedDate.day == now.day) {
        return DateFormat("HH:mm").format(parsedDate);
      } else if (difference.inDays < 7) {
        return _getWeekdayName(parsedDate.weekday);
      } else {
        return DateFormat("dd.MM.yyyy").format(parsedDate);
      }
    } catch (e) {
      debugPrint("Ошибка форматирования даты: $e");
      return "";
    }
  }

  String _getWeekdayName(int weekday) {
    const List<String> weekdays = ["пн", "вт", "ср", "чт", "пт", "сб", "вс"];
    return weekdays[weekday - 1];
  }
}
