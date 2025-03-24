import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/add_group_members_screen.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/bloc/group_bloc.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/edit_group_screen.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/remove_group_members_screen.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class GroupInfoScreen extends StatefulWidget {
  final int groupId;

  const GroupInfoScreen({super.key, required this.groupId});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadGroupInfo();
  }

  void _loadGroupInfo() {
    context.read<GroupBloc>().add(LoadGroupInfoEvent(widget.groupId));
  }

  void _leaveGroup() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.leaveGroup),
            content: Text(AppLocalizations.of(context)!.confirmLeaveGroup),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<GroupBloc>().add(
                    LeaveGroupChatEvent(widget.groupId),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.leave,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  void _editGroup(String name, String description, String avatar) async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder:
            (context) => EditGroupScreen(
              groupId: widget.groupId,
              currentName: name,
              currentDescription: description,
              avatarUrl: avatar,
            ),
      ),
    );

    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupBloc, GroupState>(
      listener: (context, state) {
        if (state is GroupUpdatedState) {
          _loadGroupInfo();
        }
        if (state is GroupMembersAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.membersAdded)),
          );
          _loadGroupInfo();
        } else if (state is GroupLeftState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.leftGroup)),
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: AppLocalizations.of(context)!.groupInfo,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  final groupState = context.read<GroupBloc>().state;
                  if (groupState is GroupInfoLoadedState) {
                    _editGroup(
                      groupState.name,
                      groupState.name, // desc
                      groupState.avatar,
                    );
                  }
                } else if (value == 'leave') {
                  _leaveGroup();
                }
              },
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(AppLocalizations.of(context)!.editGroup),
                    ),
                    PopupMenuItem(
                      value: 'leave',
                      child: Text(AppLocalizations.of(context)!.leaveGroup),
                    ),
                  ],
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: BlocBuilder<GroupBloc, GroupState>(
          builder: (context, state) {
            if (state is GroupInfoLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GroupInfoLoadedState) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              state.avatar.isNotEmpty
                                  ? NetworkImage(state.avatar)
                                  : null,
                          child:
                              state.avatar.isEmpty
                                  ? const Icon(Icons.group, size: 40)
                                  : null,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${state.members.length} ${AppLocalizations.of(context)!.members}",
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(AppLocalizations.of(context)!.notifications),
                    trailing: Switch(
                      value: _notificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.person_add),
                    title: Text(AppLocalizations.of(context)!.addMembers),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => AddGroupMembersScreen(
                                groupId: widget.groupId,
                              ),
                        ),
                      );
                      _loadGroupInfo();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_remove),
                    title: Text(AppLocalizations.of(context)!.removeMembers),
                    enabled: state.members.isNotEmpty,
                    onTap:
                        state.members.isEmpty
                            ? null
                            : () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => RemoveGroupMembersScreen(
                                        groupId: widget.groupId,
                                        members: state.members,
                                      ),
                                ),
                              );
                              _loadGroupInfo();
                            },
                  ),
                  Expanded(
                    child:
                        state.members.isNotEmpty
                            ? ListView.builder(
                              itemCount: state.members.length,
                              itemBuilder: (context, index) {
                                final member = state.members[index];
                                return ListTile(
                                  leading: AvatarWidget(
                                    avatarUrl: member.avatar,
                                    name: member.name,
                                    surname: member.surname,
                                    username: member.username,
                                    radius: 20,
                                  ),
                                  title: Text(member.username),
                                );
                              },
                            )
                            : Center(
                              child: Text(
                                AppLocalizations.of(context)!.noMembers,
                              ),
                            ),
                  ),
                ],
              );
            } else if (state is GroupInfoErrorState) {
              return Center(
                child: Text(
                  "${AppLocalizations.of(context)!.error} ${state.failure}",
                ),
              );
            }
            return Center(child: Text(AppLocalizations.of(context)!.noData));
          },
        ),
      ),
    );
  }
}
