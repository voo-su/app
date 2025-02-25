import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/theme/colors.dart';
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChatBloc>().add(const ChatEvent(ChatParams()));

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.chats,
        hasSearch: true,
        searchController: _searchController,
        onSearchChanged: (value) {
          print("Поиск: $value");
        },
      ),
      body: ChatListWidget(),
    );
  }
}
