import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';

class MessageInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;

  const MessageInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required FocusNode focusNode,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  Future<void> pickImage(BuildContext context) async {
    PermissionStatus status;

    if (Platform.isIOS) {
      // iOS
      status = await Permission.photos.status;
      if (status.isDenied || status.isRestricted || status.isLimited) {
        status = await Permission.photos.request();
      }
    } else {
      // Android
      status = await Permission.storage.status;
      if (status.isDenied || status.isRestricted) {
        status = await Permission.storage.request();
      }
    }

    if (status.isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        print("Выбрано изображение: ${image.path}");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(AppLocalizations.of(context)!.photoSelected),
              content: Text("Ваше фото обязательно отправится, но чуть позже!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.ok),
                ),
              ],
            );
          },
        );
      }
    } else {
      if (status.isPermanentlyDenied) {
        openAppSettings();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.allowPhotoAccess)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        // IconButton(
        //   icon: Icon(
        //     Icons.attach_file_outlined,
        //     color: colors.onSurfaceVariant,
        //   ),
        //   onPressed: () => pickImage(context),
        // ),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: colors.onSurfaceVariant),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: colors.surfaceContainerHighest,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              // suffixIcon: IconButton(
              //   icon: Icon(
              //     Icons.emoji_emotions_outlined,
              //     color: colors.onSurfaceVariant,
              //   ),
              //   onPressed: () {
              //   },
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
