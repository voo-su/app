import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/bloc/group_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class EditGroupScreen extends StatefulWidget {
  final int groupId;
  final String currentName;
  final String currentDescription;
  final String avatarUrl;

  const EditGroupScreen({
    super.key,
    required this.groupId,
    required this.currentName,
    required this.currentDescription,
    required this.avatarUrl,
  });

  @override
  State<EditGroupScreen> createState() => _EditGroupScreenState();
}

class _EditGroupScreenState extends State<EditGroupScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _descriptionController = TextEditingController(
      text: widget.currentDescription,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_nameController.text.trim().isNotEmpty &&
        _nameController.text.trim() != widget.currentName) {
      context.read<GroupBloc>().add(
        EditGroupNameEvent(
          groupId: widget.groupId,
          newName: _nameController.text.trim(),
        ),
      );
    }

    if (_descriptionController.text.trim().isNotEmpty &&
        _descriptionController.text.trim() != widget.currentDescription) {
      context.read<GroupBloc>().add(
        EditGroupDescriptionEvent(
          groupId: widget.groupId,
          newDescription: _descriptionController.text.trim(),
        ),
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.editGroup,
        actions: [
          TextButton(
            onPressed: _saveChanges,
            child: Text(
              AppLocalizations.of(context)!.done,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: AvatarWidget(
                avatarUrl: widget.avatarUrl,
                name: widget.currentName,
                surname: "",
                username: "",
                radius: 50,
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.groupName,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.groupDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
