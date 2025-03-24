import 'dart:io';

import 'package:fixnum/fixnum.dart' as fixnum;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/cubit/upload_cubit.dart';
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
  final _imagePicker = ImagePicker();

  XFile? _pickedFile;

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

  void _saveChanges() async {
    final trimmedName = _nameController.text.trim();
    String? newAvatar;

    if (_pickedFile != null) {
      context.read<UploadCubit>().selectFile(
        _pickedFile!.path,
        UploadPurpose.groupPhoto,
      );
      final uploadCubit = context.read<UploadCubit>();
      await uploadCubit.uploadFile();

      final state = uploadCubit.state;
      if (state is FileUploadSuccess &&
          state.purpose == UploadPurpose.groupPhoto) {
        final uploaded = state.uploadedFile;
        newAvatar = uploaded.name;

        final inputPhoto = InputPhoto(
          file: InputFile(
            id: fixnum.Int64(uploaded.id),
            parts: uploaded.parts,
            name: uploaded.name,
          ),
        );

        context.read<GroupBloc>().add(
          UpdateGroupPhotoEvent(widget.groupId, inputPhoto),
        );
      }
    }

    final result = <String, String>{};

    if (trimmedName.isNotEmpty && trimmedName != widget.currentName) {
      context.read<GroupBloc>().add(
        UpdateGroupNameEvent(widget.groupId, trimmedName),
      );
      result['name'] = trimmedName;
    }

    if (newAvatar != null) {
      result['avatar'] = newAvatar;
    }

    Navigator.pop(context, result.isEmpty ? null : result);
  }

  void _pickImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedFile = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is FileUploadSuccess &&
            state.purpose == UploadPurpose.groupPhoto) {
          final file = state.uploadedFile;
          final inputPhoto = InputPhoto(
            file: InputFile(
              id: fixnum.Int64(file.id),
              parts: file.parts,
              name: file.name,
            ),
          );
          context.read<GroupBloc>().add(
            UpdateGroupPhotoEvent(widget.groupId, inputPhoto),
          );
        }
      },
      child: Scaffold(
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
                child: GestureDetector(
                  onTap: _pickImage,
                  child:
                      _pickedFile != null
                          ? CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(File(_pickedFile!.path)),
                          )
                          : AvatarWidget(
                            avatarUrl: widget.avatarUrl,
                            name: widget.currentName,
                            surname: "",
                            username: "",
                            radius: 50,
                          ),
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
      ),
    );
  }
}
