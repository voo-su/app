import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/add_members_screen.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/group/group_info_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';

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
    context.read<GroupInfoBloc>().add(LoadGroupInfoEvent(widget.groupId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Информация о группе")),
      body: BlocBuilder<GroupInfoBloc, GroupInfoState>(
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
                      Text("${state.members.length} участников"),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Уведомления"),
                  trailing: Switch(
                    value: _notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                      print("Уведомления: $value");
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text("Добавить участников"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMembersScreen(),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ListView.builder(
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
                  ),
                ),
              ],
            );
          } else if (state is GroupInfoErrorState) {
            return Center(child: Text("Ошибка: ${state.failure}"));
          }
          return const Center(child: Text("Нет данных"));
        },
      ),
    );
  }
}
