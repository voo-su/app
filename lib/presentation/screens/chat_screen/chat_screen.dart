import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/router.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_list_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

import 'bloc/chat_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openNewChatScreen() {
    Navigator.pushNamed(context, AppRouter.newChat);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    context.read<ChatBloc>().add(const ChatEvent(ChatParams()));

    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.chats,
        hasSearch: true,
        searchController: _searchController,
        onSearchChanged: (value) {
          setState(() {
            _searchQuery = value.toLowerCase();
          });
        },
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 26),
            onPressed: _openNewChatScreen,
          ),
        ],
      ),
      body: ChatListWidget(searchQuery: _searchQuery),
    );
  }
}
