import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/presentation/cubit/chat_updates_cubit.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {

    context.read<ChatUpdatesCubit>();

    return Scaffold(
      body: BlocBuilder<ChatUpdatesCubit, List<ChatUpdate>>(
        builder: (context, updates) {
          print('<< VLog - TestScreen $updates>>');
          return ListView.builder(
            itemCount: updates.length,
            itemBuilder: (context, index) {
              final update = updates[index];

              if (update is UpdateNewMessage) {
                return ListTile(
                  title: Text("UpdateNewMessage: ${update.message.content}"),
                );
              } else if (update is UpdateChatReadInbox) {
                return ListTile(
                  title: Text("lastReadInboxMessageId: ${update.lastReadInboxMessageId}"),
                );
              } else if (update is UpdateUserTyping) {
                return ListTile(title: Text("UpdateUserTyping: ${update.userId}"));
              }

              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
