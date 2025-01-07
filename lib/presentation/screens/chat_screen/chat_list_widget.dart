import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Expanded(
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoading) {
            // TODO loading
            return Center(child: Text(AppLocalizations.of(context)!.pleaseWait));
          }

          if (state is ChatLoaded) {
            if (state.chats.isEmpty) {
              return Center(child: Text(AppLocalizations.of(context)!.noChats));
            }

            return ListView.builder(
              itemCount: state.chats.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 14,
                bottom: (80 + MediaQuery.of(context).padding.bottom),
              ),
              itemBuilder: (context, index) => InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(state.chats[index].avatar),
                          ),
                          if (state.chats[index].isOnline)
                            const CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: size.width * 0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.chats[index].name,
                              style: TextStyle(
                                fontWeight: !state.chats[index].isSeen
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '${state.chats[index].msgText} - ${state.chats[index].updatedAt}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: !state.chats[index].isSeen
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (state.chats[index].isSeen)
                        CircleAvatar(
                          radius: 8,
                          backgroundImage:
                              NetworkImage(state.chats[index].avatar),
                        ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text(AppLocalizations.of(context)!.errorOccurred));
          }
        },
      ),
    );
  }
}
