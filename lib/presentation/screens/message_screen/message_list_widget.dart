import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/l10n/generated/app_localizations.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/message_item_widget.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> testMessages = [
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
      "Привет! Как дела?",
      "Привет! Всё хорошо, а у тебя?",
      "Тоже отлично. Чем занимаешься?",
      "Работаю",
    ];

    return Expanded(
      child: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state is LoadingState) {
            // return Center(
            //   child: Text(AppLocalizations.of(context)!.pleaseWait),
            // );
          }

          if (state is SuccessState) {
            // if (state.messages.isEmpty) {
            //   return Center(
            //     child: Text(AppLocalizations.of(context)!.nothingFound),
            //   );
            // }

            return ListView.builder(
              itemCount: testMessages.length,
              // itemCount: state.messages.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 14,
                bottom: (80 + MediaQuery.of(context).padding.bottom),
              ),
              itemBuilder: (context, index) => MessageItemWidget(
                text: testMessages[index],
              ),
              // itemBuilder: (context, index) => MessageItemWidget(
              //   message: state.messages[index],
              // ),
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
