import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_list_widget.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            MessageListWidget(),
          ],
        ),
      ),
    );
  }
}
