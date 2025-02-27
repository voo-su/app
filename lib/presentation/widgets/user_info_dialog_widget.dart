import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';

class UserInfoDialog extends StatelessWidget {
  final Contact contact;

  const UserInfoDialog({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
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
              const SizedBox(height: 8),
              Text(
                "${contact.name} ${contact.surname}",
                style: TextStyle(fontSize: 14, color: colors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: colors.primary.withOpacity(0.1),
                      ),
                      child: Text(
                        "Отправить сообщение",
                        style: TextStyle(color: colors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.red.withOpacity(0.1),
                      ),
                      child: const Text(
                        "Удалить контакт",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
