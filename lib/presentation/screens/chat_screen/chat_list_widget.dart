import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_item_widget.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: Text(AppLocalizations.of(context)!.pleaseWait),
            );
          }

          if (state is SuccessState) {
            if (state.chats.isEmpty) {
              return Center(child: Text(AppLocalizations.of(context)!.noChats));
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ChatBloc>().add(const ChatEvent(ChatParams()));
              },
              child: ListView.builder(
                itemCount: state.chats.length,
                physics: const BouncingScrollPhysics(),
                // padding: EdgeInsets.only(
                //   top: 14,
                //   bottom: (80 + MediaQuery.of(context).padding.bottom),
                // ),
                itemBuilder:
                    (context, index) =>
                        ChatItemWidget(chat: state.chats[index]),
              ),
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.errorOccurred),
            );
          }
        },
      ),
    );
  }
}
