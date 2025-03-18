import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/bloc/group_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class RemoveGroupMembersScreen extends StatelessWidget {
  final int groupId;
  final List<Contact> members;

  const RemoveGroupMembersScreen({
    super.key,
    required this.groupId,
    required this.members,
  });

  void _removeMember(BuildContext context, int memberId) {
    context.read<GroupBloc>().add(
      RemoveUserFromGroupChatEvent(groupId: groupId, memberId: memberId),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.removeMember,
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];

          return ListTile(
            leading: AvatarWidget(
              avatarUrl: member.avatar,
              name: member.name,
              surname: member.surname,
              username: member.username,
              radius: 20,
            ),
            title: Text(member.username),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () => _removeMember(context, member.id),
            ),
          );
        },
      ),
    );
  }
}
