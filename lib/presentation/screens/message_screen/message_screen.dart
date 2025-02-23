import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_list_widget.dart';
import 'package:voo_su/presentation/widgets/message_input_widget.dart';

class MessageScreen extends StatefulWidget {
  final Chat chat;

  const MessageScreen({
    super.key,
    required this.chat,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<MessageBloc>().add(MessageEvent(MessageParams(
          chatType: widget.chat.chatType,
          receiverId: widget.chat.receiverId,
          recordId: 0,
          limit: 30,
        )));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimarySurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimarySurface,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        title: Text(
          widget.chat.name.isNotEmpty ? widget.chat.name : widget.chat.username,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: AppColors.lightOnSurface20,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: MessageListWidget()),
          Container(
            color: AppColors.lightBackground,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  color: AppColors.lightBackground,
                  child: Row(
                    children: [
                      Expanded(
                        child: MessageInputWidget(
                          controller: _messageController,
                          hintText: "Сообщение",
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.blue),
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
    );
  }
}
