import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';

class MessageInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function(String path) onFilePicked;
  final int maxLines;

  const MessageInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required FocusNode focusNode,
    required this.onFilePicked,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  Future<void> pickImage(BuildContext context) async {
    PermissionStatus status;

    if (Platform.isIOS) {
      status = await Permission.photos.status;
      if (status.isDenied || status.isRestricted || status.isLimited) {
        status = await Permission.photos.request();
      }
    } else {
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

        onFilePicked(image.path);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(AppLocalizations.of(context)!.photoSelected),
              content: Text(AppLocalizations.of(context)!.fileWillBeSent),
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

  Future<void> pickFile(BuildContext context) async {
    PermissionStatus status;
    if (Platform.isIOS) {
      status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
      }
    } else {
      status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }
    }

    if (status.isGranted) {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.single.path;
        if (filePath != null) {
          print("Выбран файл: $filePath");
          onFilePicked(filePath);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(AppLocalizations.of(context)!.fileSelected),
                content: Text(AppLocalizations.of(context)!.fileWillBeSent),
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
      }
    } else {
      if (status.isPermanentlyDenied) {
        openAppSettings();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.allowFileAccess)),
      );
    }
  }

  void _showAttachmentOptions(BuildContext context) async {
    final rootContext = context;

    showModalBottomSheet(
      context: rootContext,
      builder: (sheetContext) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text(AppLocalizations.of(rootContext)!.uploadPhoto),
              onTap: () {
                Navigator.pop(sheetContext);
                pickImage(rootContext);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: Text(AppLocalizations.of(rootContext)!.uploadFile),
              onTap: () {
                Navigator.pop(sheetContext);
                pickFile(rootContext);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.attach_file_outlined,
            color: colors.onSurfaceVariant,
          ),
          onPressed: () => _showAttachmentOptions(context),
        ),
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
