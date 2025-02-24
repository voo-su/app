import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // print(
    //     " name - ${contact.name}  surname - ${contact.surname}  username - ${contact.username}");

    return InkWell(
      child: Container(
        color: Colors.amberAccent,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  AvatarWidget(
                    avatarUrl: contact.avatar,
                    name: contact.name,
                    surname: contact.surname,
                    username: contact.username,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        contact.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w400),
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
