import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/bloc/group_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_list_widget.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/group_info_screen.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';
import 'package:voo_su/presentation/widgets/message_input_widget.dart';
import 'package:voo_su/presentation/widgets/user_info_dialog_widget.dart';

class MessageScreen extends StatefulWidget {
  final Chat chat;

  const MessageScreen({super.key, required this.chat});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final Set<int> _selectedMessageIds = {};
  late Chat _chat;

  Message? _replyMessage;
  String? _replyUser;
  bool _isSelectionMode = false;
  bool _areNotifsEnabled = false;

  @override
  void initState() {
    super.initState();
    _chat = widget.chat;
    context.read<MessageBloc>().add(
      LoadHistoryEvent(
        MessageParams(
          chatType: widget.chat.chatType,
          receiverId: widget.chat.receiverId,
          messageId: 0,
          limit: 30,
        ),
      ),
    );

    // context.read<MessageBloc>().add(
    //   DeleteMessagesEvent(
    //     DeleteMessagesParams(
    //       chatType: widget.chat.chatType,
    //       receiverId: widget.chat.receiverId,
    //       messageIds: _selectedMessageIds.toList(),
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onChooseMessage(int messageId) {
    setState(() {
      _isSelectionMode = true;
      _selectedMessageIds.add(messageId);
    });
  }

  void toggleSelection(int messageId) {
    setState(() {
      if (_selectedMessageIds.contains(messageId)) {
        _selectedMessageIds.remove(messageId);
        if (_selectedMessageIds.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedMessageIds.add(messageId);
      }
    });
  }

  void cancelSelection() {
    setState(() {
      _isSelectionMode = false;
      _selectedMessageIds.clear();
    });
  }

  void deleteSelectedMessages() {
    print("Удаляем выбранные: $_selectedMessageIds");

    context.read<MessageBloc>().add(
      DeleteMessagesEvent(
        DeleteMessagesParams(
          chatType: widget.chat.chatType,
          receiverId: widget.chat.receiverId,
          messageIds: _selectedMessageIds.toList(),
        ),
      ),
    );

    setState(() {
      _isSelectionMode = false;
      _selectedMessageIds.clear();
    });
  }

  void _handleReply(Message message, String replyUser) {
    setState(() {
      _replyMessage = message;
      _replyUser = replyUser;
    });
    _focusNode.requestFocus();
  }

  void _clearReply() {
    setState(() {
      _replyMessage = null;
      _replyUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocListener<GroupBloc, GroupState>(
      listener: (context, state) {
        if (state is GroupDeletedState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.groupDeleted)),
          );
        }
        if (state is GroupUpdatedState) {
          print("чат обновление");
          context.read<MessageBloc>().add(
            LoadHistoryEvent(
              MessageParams(
                chatType: widget.chat.chatType,
                receiverId: widget.chat.receiverId,
                messageId: 0,
                limit: 30,
              ),
            ),
          );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colors.background,
          appBar: _buildAppBar(),
          body: Column(
            children: <Widget>[
              Expanded(
                child: MessageListWidget(
                  receiverId: widget.chat.receiverId,
                  chatName:
                      widget.chat.name.isNotEmpty
                          ? widget.chat.name
                          : widget.chat.username,
                  onReply: _handleReply,
                  isSelectionMode: _isSelectionMode,
                  selectedMessageIds: _selectedMessageIds,
                  onChooseMessage: onChooseMessage,
                  onToggleSelection: toggleSelection,
                ),
              ),
              if (_replyMessage != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _replyUser ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _replyMessage!.content,
                              style: const TextStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 16),
                        onPressed: _clearReply,
                      ),
                    ],
                  ),
                ),
              Container(
                color: colors.background,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      color: colors.background,
                      child: Row(
                        children: [
                          Expanded(
                            child: MessageInputWidget(
                              controller: _messageController,
                              focusNode: _focusNode,
                              hintText:
                                  AppLocalizations.of(context)!.writeMessage,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(Icons.send, color: colors.primary),
                            onPressed: () {
                              if (_messageController.text.trim().isEmpty)
                                return;

                              context.read<MessageBloc>().add(
                                SendMessagesEvent(
                                  SendMessageParams(
                                    chatType: widget.chat.chatType,
                                    receiverId: widget.chat.receiverId,
                                    messageId: 0,
                                    message: _messageController.text.trim(),
                                    replyToMsgId: _replyMessage?.id,
                                  ),
                                ),
                              );

                              print(
                                "Отправка: ${_messageController.text} | Ответ на: ${_replyMessage?.id}",
                              );

                              _messageController.clear();
                              _clearReply();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final colors = Theme.of(context).colorScheme;

    if (_isSelectionMode) {
      return CustomAppBar(
        titleText:
            "${AppLocalizations.of(context)!.selected} ${_selectedMessageIds.length}",
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: colors.onSurface),
            onPressed: deleteSelectedMessages,
          ),
        ],
      );
    } else {
      return CustomAppBar(
        titleWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AvatarWidget(
              avatarUrl: _chat.avatar,
              name: _chat.name,
              surname: _chat.surname,
              username: _chat.username,
              radius: 16,
            ),
            const SizedBox(width: 10),
            Text(
              _chat.name.isNotEmpty ? _chat.name : _chat.username,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onTap: () async {
          if (widget.chat.chatType == 1) {
            showDialog(
              context: context,
              builder: (context) {
                final contact = Contact(
                  id: widget.chat.id,
                  avatar: widget.chat.avatar,
                  name: widget.chat.name,
                  surname: widget.chat.surname,
                  username: widget.chat.username,
                );
                return UserInfoDialog(contact: contact);
              },
            );
          }
          if (_chat.chatType == 2) {
            final updatedName = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        GroupInfoScreen(groupId: widget.chat.receiverId),
              ),
            );

            if (updatedName != null && updatedName.isNotEmpty) {
              setState(() {
                _chat = _chat.copyWith(name: updatedName);
              });
            }
          }
        },
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: colors.onSurface),
            onPressed: _showChatMenu,
          ),
        ],
      );
    }
  }

  void _showChatMenu() async {
    final String notifsText =
        _areNotifsEnabled
            ? AppLocalizations.of(context)!.disableNotifications
            : AppLocalizations.of(context)!.enableNotifications;

    final IconData notifsIcon =
        _areNotifsEnabled ? Icons.volume_off : Icons.volume_up;
    final String notifsValue = _areNotifsEnabled ? "disable" : "enable";

    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(1, 80, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: [
        PopupMenuItem(
          value: notifsValue,
          child: Row(
            children: [
              Icon(notifsIcon, size: 20),
              const SizedBox(width: 8),
              Text(notifsText),
            ],
          ),
        ),
        if (widget.chat.chatType == 2)
          PopupMenuItem(
            value: "delete",
            child: Row(
              children: [
                Icon(Icons.delete, size: 20),
                const SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.deleteGroup),
              ],
            ),
          ),
      ],
    );

    if (result == "enable") {
      setState(() {
        _areNotifsEnabled = true;
      });
      print("Уведомления включены");
    } else if (result == "disable") {
      setState(() {
        _areNotifsEnabled = false;
      });
      print("Уведомления отключены");
    } else if (result == "delete") {
      _confirmDeleteGroup();
    }
  }

  void _confirmDeleteGroup() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.deleteGroup),
            content: Text(AppLocalizations.of(context)!.confirmDeleteGroup),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<GroupBloc>().add(
                    DeleteGroupEvent(widget.chat.receiverId),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.delete,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}
