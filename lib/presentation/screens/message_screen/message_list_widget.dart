import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_item_widget.dart';

class MessageListWidget extends StatelessWidget {
  final int receiverId;

  const MessageListWidget({super.key, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SuccessState) {
          if (state.messages.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.nothingFound),
            );
          }

          return ListView.builder(
            itemCount: state.messages.length,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            padding: EdgeInsets.only(top: 12, bottom: 12),
            itemBuilder:
                (context, index) => MessageItemWidget(
              message: state.messages[index],
              receiverId: receiverId,
            ),
          );
        }

        return Center(child: Text(AppLocalizations.of(context)!.errorOccurred));
      },
    );
  }
}
