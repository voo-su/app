import 'package:flutter/material.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_list_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            ContactListWidget(),
          ],
        ),
      ),
    );
  }
}
