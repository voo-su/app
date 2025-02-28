import 'dart:async';

import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/presentation/cubit/chat_updates_cubit.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';

class ChatUpdatesListener {
  late final StreamSubscription<List<ChatUpdate>> _subscription;
  final ChatUpdatesCubit chatUpdatesCubit;
  final MessageBloc messageBloc;

  ChatUpdatesListener({
    required this.chatUpdatesCubit,
    required this.messageBloc,
  }) {
    _subscription = chatUpdatesCubit.stream.listen(_handleUpdate);
  }

  void _handleUpdate(List<ChatUpdate> updates) {
    for (var update in updates) {
      if (update is UpdateNewMessage) {
        messageBloc.add(NewMessageEvent(update.message));
      } else if (update is UpdateChatReadInbox) {
        print('<< VLog - lastReadInboxMessageId >>');
      } else if (update is UpdateUserTyping) {
        print('<< VLog - userTyping >>');
      }
    }
  }

  void dispose() {
    _subscription.cancel();
  }
}
