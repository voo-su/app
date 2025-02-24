import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_item_widget.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: Text(AppLocalizations.of(context)!.pleaseWait),
            );
          }

          if (state is SuccessState) {
            if (state.contacts.isEmpty) {
              return Center(
                child: Text(AppLocalizations.of(context)!.nothingFound),
              );
            }

            return ListView.builder(
              itemCount: state.contacts.length,
              physics: const BouncingScrollPhysics(),
              // padding: EdgeInsets.only(
              //   top: 14,
              //   bottom: (80 + MediaQuery.of(context).padding.bottom),
              // ),
              itemBuilder:
                  (context, index) =>
                      ContactItemWidget(contact: state.contacts[index]),
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.errorOccurred),
            );
          }
        },
      ),
    );
  }
}
