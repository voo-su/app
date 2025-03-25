import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/core/utils/time_formatter.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_screen.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/popup_menu_widget.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;

  const ChatItemWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onLongPressStart: (details) {
        _showChatMenu(context, details.globalPosition);
      },
      child: InkWell(
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
                AvatarWidget(
                  avatarUrl: chat.avatar,
                  name: chat.name,
                  surname: chat.surname,
                  username: chat.username,
                  isOnline: chat.isOnline,
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
                                color: colors.onSurface,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ChatTimeFormatterWidget(dateTime: chat.updatedAt),
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
                                color: colors.onSurfaceVariant,
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
      ),
    );
  }

  void _showChatMenu(BuildContext context, Offset position) async {
    final result = await showPopupMenu<String>(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: 'mute',
          child: Row(
            children: [
              Icon(Icons.notifications_off_outlined, size: 20),
              SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.disableNotifications),
            ],
          ),
        ),

        // PopupMenuItem(
        //   value: 'delete',
        //   child: Row(
        //     children: const [
        //       Icon(Icons.delete_outline, size: 20, color: Colors.red),
        //       SizedBox(width: 8),
        //       Text("Удалить", style: TextStyle(color: Colors.red)),
        //     ],
        //   ),
        // ),
      ],
    );

    switch (result) {
      case 'mute':
        _muteChat(context);
        break;
      case 'delete':
        _deleteChat();
        break;
    }
  }

  void _muteChat(BuildContext context) {
    context.read<ChatBloc>().add(
      ChatUpdateNotifySettingsEvent(
        chat.receiver,
        const ChatParams(),
      ),
    );

    print("Отключен звук для чата: ${chat.receiver.chatType}");
  }

  void _deleteChat() {
    print("Удален чат: ${chat.id}");
  }
}
