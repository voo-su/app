import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/message_bubble_widget.dart';
import 'package:voo_su/presentation/widgets/popup_menu_widget.dart';

class MessageItemWidget extends StatefulWidget {
  final Message message;
  final int receiverId;
  final String chatName;
  final Function(Message, String) onReply;

  const MessageItemWidget({
    super.key,
    required this.message,
    required this.receiverId,
    required this.chatName,
    required this.onReply,
  });

  @override
  State<MessageItemWidget> createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _isSwiped = false;

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

    return GestureDetector(
      onLongPressStart: (details) {
        _showMessageMenu(context, details.globalPosition);
      },
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! < -10 && !_isSwiped) {
          _isSwiped = true;
          _animationController.forward();
          final replyUser = isMine ? "Вы" : widget.chatName;
          widget.onReply(widget.message, replyUser);
        }
      },
      onHorizontalDragEnd: (_) {
        if (_isSwiped) {
          _isSwiped = false;
          _animationController.reverse();
        }
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: MessageBubbleWidget(
          message: widget.message.content,
          isMine: isMine,
          createdAt: widget.message.createdAt,
          isRead: widget.message.isRead,
        ),
      ),
    );
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

  //без анимации
  void _replyMessage() {
    final replyUser =
        widget.message.userId != widget.receiverId ? "Вы" : widget.chatName;
    widget.onReply(widget.message, replyUser);
  }

  void _chooseMessages() {
    print("Выбрать сообщение");
  }

  void _copyMessage(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widget.message.content));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Сообщение скопировано")),
    );
  }

  void _deleteMessage() {
    print("Удалено сообщение: ${widget.message.id}");
  }
}
