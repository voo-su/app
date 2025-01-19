import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_list_widget.dart';

import 'bloc/chat_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<ChatBloc>().add(const ChatEvent(ChatParams()));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.chats,
                style: TextStyle(
                  color: const Color(0xff070508),
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          ChatListWidget(),
        ],
      ),
    );
  }
}
