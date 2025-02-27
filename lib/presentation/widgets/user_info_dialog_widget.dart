import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';

class UserInfoDialog extends StatelessWidget {
  final Contact contact;

  const UserInfoDialog({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Center(
            child: AvatarWidget(
              avatarUrl: contact.avatar,
              name: contact.name,
              surname: contact.surname,
              username: contact.username,
              radius: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            contact.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: colors.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            contact.username,
            style: TextStyle(fontSize: 14, color: colors.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "${contact.name} ${contact.surname}",
            style: TextStyle(fontSize: 14, color: colors.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Отправить сообщение",
            style: TextStyle(color: colors.primary),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Удалить контакт", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
