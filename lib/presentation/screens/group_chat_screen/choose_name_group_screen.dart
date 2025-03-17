import 'package:flutter/material.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/create_new_group_screen.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class ChooseNameGroupScreen extends StatefulWidget {
  const ChooseNameGroupScreen({super.key});

  @override
  State<ChooseNameGroupScreen> createState() => _ChooseNameGroupScreenState();
}

class _ChooseNameGroupScreenState extends State<ChooseNameGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  void _proceedToSelectContacts() {
    if (_groupNameController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => CreateNewGroupScreen(
                groupName: _groupNameController.text.trim(),
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Назовите группу",
        actions: [
          TextButton(
            onPressed: _proceedToSelectContacts,
            child: Text(
              "Далее",
              style: TextStyle(
                color:
                    _groupNameController.text.trim().isNotEmpty
                        ? colors.primary
                        : colors.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _groupNameController,
                    onChanged: (value) => setState(() {}),
                    autofocus: true,
                    style: TextStyle(fontSize: 14, color: colors.onSurface),
                    decoration: InputDecoration(
                      hintText: "Введите название группы",
                      hintStyle: TextStyle(color: colors.onSurfaceVariant),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (_groupNameController.text.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.close, color: colors.onSurfaceVariant),
                    onPressed: () {
                      _groupNameController.clear();
                      setState(() {});
                    },
                  ),
              ],
            ),
            Divider(color: colors.outlineVariant, thickness: 1),
          ],
        ),
      ),
    );
  }
}
