import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/user_info_dialog_widget.dart';

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap:
          () => showDialog(
            context: context,
            builder: (context) => UserInfoDialog(contact: contact),
          ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarWidget(
                avatarUrl: contact.avatar,
                name: contact.name,
                surname: contact.surname,
                username: contact.username,
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: size.width * 0.70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        contact.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
