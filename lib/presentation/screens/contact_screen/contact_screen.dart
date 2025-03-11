import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_list_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    context.read<ContactBloc>().add(const ContactEvent(ContactParams()));

    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(titleText: AppLocalizations.of(context)!.contacts),
      body: Column(children: <Widget>[ContactListWidget()]),
    );
  }
}
