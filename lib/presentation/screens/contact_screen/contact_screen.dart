import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/l10n/generated/app_localizations.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_list_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(const ContactEvent(ContactParams()));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.contacts,
                style: TextStyle(
                  color: const Color(0xff070508),
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          ContactListWidget(),
        ],
      ),
    );
  }
}
