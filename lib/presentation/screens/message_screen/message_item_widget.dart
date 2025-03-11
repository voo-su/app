import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/audio_message_bubble_widget.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/photo_message_bubble_widget.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/reply_message_bubble_widget.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/text_message_bubble_widget.dart';
import 'package:voo_su/presentation/widgets/popup_menu_widget.dart';

class MessageItemWidget extends StatefulWidget {
  final Message message;
  final int receiverId;
  final String chatName;
  final Function(Message, String) onReply;

  final bool isSelectionMode;
  final bool isSelected;
  final ValueChanged<int> onChooseMessage;
  final ValueChanged<int> onToggleSelection;

  const MessageItemWidget({
    super.key,
    required this.message,
    required this.receiverId,
    required this.chatName,
    required this.onReply,
    required this.isSelectionMode,
    required this.isSelected,
    required this.onChooseMessage,
    required this.onToggleSelection,
  });

  @override
  State<MessageItemWidget> createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _isSwiped = false;
  final String audioUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.2, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMine = widget.message.userId != widget.receiverId;
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        if (widget.isSelectionMode) {
          widget.onToggleSelection(widget.message.id);
        }
      },
      onLongPressStart: (details) {
        if (!widget.isSelectionMode) {
          _showMessageMenu(context, details.globalPosition);
        }
      },
      onHorizontalDragUpdate: (details) {
        if (!widget.isSelectionMode) {
          if (details.primaryDelta != null &&
              details.primaryDelta! < -10 &&
              !_isSwiped) {
            _isSwiped = true;
            _animationController.forward();
            final replyUser = isMine ? "Вы" : widget.chatName;
            widget.onReply(widget.message, replyUser);
          }
        }
      },
      onHorizontalDragEnd: (_) {
        if (_isSwiped) {
          _isSwiped = false;
          _animationController.reverse();
        }
      },
      child: Container(
        color:
            widget.isSelected
                ? colors.surfaceContainerHighest
                : Colors.transparent,
        child: SlideTransition(
          position: _offsetAnimation,
          child: _buildMessageContent(widget.message, isMine),
        ),
      ),
    );
  }

  Widget _buildMessageContent(Message message, bool isMine) {
    switch (message.msgType) {
      case 1:
        return TextMessageBubble(message: message, isMine: isMine);
      case 3:
        return PhotoMessageBubble(message: message, isMine: isMine);
      case 4:
        return AudioMessageBubble(
          message: message,
          isMine: isMine,
          audioUrl: audioUrl,
        );
      case 9:
        return ReplyMessageBubble(
          message: message,
          isMine: isMine,
          replyUser: widget.chatName,
        );
      default:
        return Text("Неизвестный тип сообщения: ${message.msgType}");
    }
  }

  void _showMessageMenu(BuildContext context, Offset position) async {
    final result = await showPopupMenu<String>(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: 'reply',
          child: Row(
            children: const [
              Icon(Icons.reply_outlined, size: 20),
              SizedBox(width: 8),
              Text("Ответить"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'choose',
          child: Row(
            children: const [
              Icon(Icons.check_circle_outline_outlined, size: 20),
              SizedBox(width: 8),
              Text("Выбрать"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'copy',
          child: Row(
            children: const [
              Icon(Icons.copy_outlined, size: 20),
              SizedBox(width: 8),
              Text("Скопировать"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: const [
              Icon(Icons.delete_outline, size: 20, color: Colors.red),
              SizedBox(width: 8),
              Text("Удалить", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    );

    if (result == 'reply') {
      _replyMessage();
    } else if (result == 'choose') {
      _chooseMessages();
    } else if (result == 'copy') {
      _copyMessage(context);
    } else if (result == 'delete') {
      _deleteMessage();
    }
  }

  void _replyMessage() {
    final replyUser =
        widget.message.userId != widget.receiverId ? "Вы" : widget.chatName;
    widget.onReply(widget.message, replyUser);
  }

  void _chooseMessages() {
    widget.onChooseMessage(widget.message.id);
  }

  void _copyMessage(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widget.message.content));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Сообщение скопировано")));
  }

  void _deleteMessage() {
    context.read<MessageBloc>().add(
      DeleteMessagesEvent(
        DeleteMessagesParams(
          chatType: widget.message.chatType,
          receiverId: widget.message.receiverId,
          messageIds: [widget.message.id],
        ),
      ),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Сообщение удалено")));
    print("Удалено сообщение: ${widget.message.id}");
  }
}
