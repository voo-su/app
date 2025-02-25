import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeFormatterWidget extends StatelessWidget {
  final String dateTime;
  final bool? isMine;

  const TimeFormatterWidget({super.key, required this.dateTime, this.isMine});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text(
      _formatTime(dateTime),
      style: TextStyle(
        fontSize: 10,
        color:
            isMine == true
                ? colors
                    .surface // мои сообщения
                : colors.onSurface, // чужие сообщения
      ),
    );
  }

  String _formatTime(String dateTime) {
    try {
      final DateTime parsedDate = DateFormat(
        "yyyy-MM-dd HH:mm:ss",
      ).parse(dateTime);
      return DateFormat("HH:mm").format(parsedDate);
    } catch (e) {
      debugPrint("Ошибка форматирования времени: $e");
      return "";
    }
  }
}

class ChatTimeFormatterWidget extends StatelessWidget {
  final String dateTime;

  const ChatTimeFormatterWidget({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text(
      _formatDateOrTime(dateTime),
      style: TextStyle(fontSize: 12, color: colors.inverseSurface),
    );
  }

  String _formatDateOrTime(String dateTime) {
    try {
      final DateTime parsedDate = DateFormat(
        "yyyy-MM-dd HH:mm:ss",
      ).parse(dateTime);
      final DateTime now = DateTime.now();
      final Duration difference = now.difference(parsedDate);

      if (difference.inHours < 24 && parsedDate.day == now.day) {
        return DateFormat("HH:mm").format(parsedDate); // Сегодня
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
