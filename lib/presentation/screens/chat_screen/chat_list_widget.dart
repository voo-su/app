import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_item_widget.dart';

class ChatListWidget extends StatelessWidget {
  final String searchQuery;

  const ChatListWidget({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: Text(AppLocalizations.of(context)!.pleaseWait));
        }

        if (state is SuccessState) {
          List<Chat> filteredChats =
              state.chats
                  .where(
                    (chat) =>
                        chat.name.toLowerCase().contains(searchQuery) ||
                        chat.username.toLowerCase().contains(searchQuery),
                  )
                  .toList();

          if (filteredChats.isEmpty) {
            return Center(child: Text(AppLocalizations.of(context)!.nothingFound));
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<ChatBloc>().add(const ChatEvent(ChatParams()));
            },
            child: ListView.builder(
              itemCount: filteredChats.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatItemWidget(chat: filteredChats[index]);
              },
            ),
          );
        }

        return Center(
          child: Text(
            AppLocalizations.of(context)!.errorOccurred,
            style: TextStyle(color: colors.onSurface),
          ),
        );
      },
    );
  }
}
