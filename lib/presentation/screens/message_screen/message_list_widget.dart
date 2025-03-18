import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_item_widget.dart';

class MessageListWidget extends StatelessWidget {
  final int receiverId;
  final String chatName;
  final Function(Message, String) onReply;

  final bool isSelectionMode;
  final Set<int> selectedMessageIds;
  final ValueChanged<int> onChooseMessage;
  final ValueChanged<int> onToggleSelection;

  const MessageListWidget({
    super.key,
    required this.receiverId,
    required this.chatName,
    required this.onReply,
    required this.isSelectionMode,
    required this.selectedMessageIds,
    required this.onChooseMessage,
    required this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SuccessState) {
          if (state.messages.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.noMessages),
            );
          }

          return ListView.builder(
            itemCount: state.messages.length,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            itemBuilder: (context, index) {
              final message = state.messages[index];
              return MessageItemWidget(
                message: message,
                receiverId: receiverId,
                chatName: chatName,
                onReply: onReply,
                isSelectionMode: isSelectionMode,
                isSelected: selectedMessageIds.contains(message.id),
                onChooseMessage: onChooseMessage,
                onToggleSelection: onToggleSelection,
              );
            },
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
