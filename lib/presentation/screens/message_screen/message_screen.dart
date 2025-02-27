import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_list_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';
import 'package:voo_su/presentation/widgets/message_input_widget.dart';

class MessageScreen extends StatefulWidget {
  final Chat chat;

  const MessageScreen({super.key, required this.chat});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final Set<String> _selectedMessageIds = {};

  Message? _replyMessage;
  String? _replyUser;
  bool _isSelectionMode = false;

  @override
  void initState() {
    super.initState();
    context.read<MessageBloc>().add(
      LoadHistoryEvent(
        MessageParams(
          chatType: widget.chat.chatType,
          receiverId: widget.chat.receiverId,
          recordId: 0,
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

  void onChooseMessage(String messageId) {
    setState(() {
      _isSelectionMode = true;
      _selectedMessageIds.add(messageId);
    });
  }

  void toggleSelection(String messageId) {
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

    return GestureDetector(
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
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                            hintText: "Сообщение",
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: Icon(Icons.send, color: colors.primary),
                          onPressed: () {
                            print("Отправка: ${_messageController.text}");
                            _messageController.clear();
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
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final colors = Theme.of(context).colorScheme;
    if (_isSelectionMode) {
      return AppBar(
        backgroundColor: colors.surface,
        title: Text(
          "Выбрано: ${_selectedMessageIds.length}",
          style: TextStyle(color: colors.onSurface),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: colors.onSurface),
          onPressed: cancelSelection,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: colors.onSurface),
            onPressed: deleteSelectedMessages,
          ),
        ],
      );
    } else {
      return CustomAppBar(
        title:
            widget.chat.name.isNotEmpty
                ? widget.chat.name
                : widget.chat.username,
      );
    }
  }
}
