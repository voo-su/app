import 'package:flutter/material.dart';

class GroupInfoScreen extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String groupAvatar;
  final List<String> members;

  const GroupInfoScreen({
    super.key,
    required this.groupId,
    required this.groupName,
    required this.groupAvatar,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Информация о группе")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      groupAvatar.isNotEmpty ? NetworkImage(groupAvatar) : null,
                  child:
                      groupAvatar.isEmpty
                          ? const Icon(Icons.group, size: 40)
                          : null,
                ),
                const SizedBox(height: 10),
                Text(
                  groupName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text("${members.length} участников"),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Уведомления"),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                print("Уведомления: $value");
              },
            ),
          ),

          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(members[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
