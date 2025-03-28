import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/cubit/upload_cubit.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  XFile? _pickedAvatarFile;
  int _selectedGender = 1;
  DateTime? _selectedDate;
  String avatarUrl = "";

  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(GetAccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.personalData)),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              if (state is SettingsSuccessState) {
                setState(() {
                  _nameController.text = state.account.name;
                  _surnameController.text = state.account.surname;
                  _emailController.text = state.account.email;
                  avatarUrl = state.account.avatar;
                  _selectedGender = state.account.gender;
                  _bioController.text = state.account.about;
                  _selectedDate =
                      state.account.birthday.isNotEmpty
                          ? DateTime.parse(state.account.birthday)
                          : null;
                });
              }
            },
          ),
          BlocListener<UploadCubit, UploadState>(
            listener: (context, state) {
              if (state is FileUploadSuccess &&
                  state.purpose == UploadPurpose.userAvatar) {
                final file = state.uploadedFile;

                final inputFile = InputFile(
                  id: Int64(file.id),
                  parts: file.parts,
                  name: file.name,
                );

                context.read<SettingsBloc>().add(
                  UpdateProfilePhotoEvent(inputFile),
                );
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickAvatar,
                  child:
                      _pickedAvatarFile != null
                          ? CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(
                              File(_pickedAvatarFile!.path),
                            ),
                          )
                          : AvatarWidget(
                            avatarUrl: avatarUrl,
                            name: _nameController.text,
                            surname: _surnameController.text,
                            username: "",
                            radius: 50,
                          ),
                ),
              ),

              const SizedBox(height: 16),
              _buildLabel(
                AppLocalizations.of(context)!.firstName,
                isRequired: true,
              ),
              _buildTextField(_nameController),
              const SizedBox(height: 16),
              _buildLabel(
                AppLocalizations.of(context)!.lastName,
                isRequired: true,
              ),
              _buildTextField(_surnameController),
              const SizedBox(height: 16),
              _buildLabel(AppLocalizations.of(context)!.gender),
              _buildGenderPicker(),
              const SizedBox(height: 16),
              _buildLabel(AppLocalizations.of(context)!.dateOfBirth),
              _buildDatePicker(context),
              const SizedBox(height: 16),
              _buildLabel(AppLocalizations.of(context)!.aboutMe),
              _buildTextField(_bioController, maxLines: 3),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.save,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _pickAvatar() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedAvatarFile = image;
      });
    }
  }

  void _saveProfile() async {
    final params = UpdateProfileParams(
      name: _nameController.text.trim(),
      surname: _surnameController.text.trim(),
      gender: _selectedGender,
      birthday:
          _selectedDate != null
              ? "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}"
              : "",
      about: _bioController.text.trim(),
    );

    context.read<SettingsBloc>().add(UpdateProfileEvent(params));

    if (_pickedAvatarFile != null) {
      final cubit = context.read<UploadCubit>();
      cubit.selectFile(_pickedAvatarFile!.path, UploadPurpose.userAvatar);
      await cubit.uploadFile();

      final state = cubit.state;
      if (state is FileUploadSuccess &&
          state.purpose == UploadPurpose.userAvatar) {
        final file = state.uploadedFile;
        final inputFile = InputFile(
          id: Int64(file.id),
          parts: file.parts,
          name: file.name,
        );

        context.read<SettingsBloc>().add(UpdateProfilePhotoEvent(inputFile));
      }
      Navigator.pop(context, true);
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.onSurface,
            ),
          ),
          if (isRequired)
            const Text(
              " *",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {int maxLines = 1}) {
    final colors = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: colors.onSurfaceVariant),
        filled: true,
        fillColor: colors.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildGenderPicker() {
    final colors = Theme.of(context).colorScheme;
    final genderMap = {
      1: AppLocalizations.of(context)!.male,
      2: AppLocalizations.of(context)!.female,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: genderMap[_selectedGender],
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedGender =
                genderMap.entries
                    .firstWhere((entry) => entry.value == newValue)
                    .key;
          });
        },
        items:
            genderMap.entries.map<DropdownMenuItem<String>>((entry) {
              return DropdownMenuItem<String>(
                value: entry.value,
                child: Text(
                  entry.value,
                  style: TextStyle(fontSize: 16, color: colors.onSurface),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _selectedDate != null
              ? _selectedDate!.toLocal().toString().split(' ')[0]
              : AppLocalizations.of(context)!.selectBirthDate,
          style: TextStyle(fontSize: 16, color: colors.onSurface),
        ),
      ),
    );
  }
}
