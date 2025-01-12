import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/contact.dart';

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              child: Column(
                children: [
                  Text(contact.username),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
