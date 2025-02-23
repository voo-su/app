import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_list_widget.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: AppColors.lightBackground,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.chats,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightOnSurface20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                      hintStyle: TextStyle(color: AppColors.lightOnSurface60),
                      filled: true,
                      fillColor: AppColors.lightSecondarySurface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      prefixIcon: const Icon(Icons.search,
                          color: AppColors.lightOnSurface60),
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            ChatListWidget(),
          ],
        ),
      ),
    );
  }
}
