import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/bloc/group_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class CreateNewGroupScreen extends StatefulWidget {
  final String groupName;

  const CreateNewGroupScreen({super.key, required this.groupName});

  @override
  State<CreateNewGroupScreen> createState() => _CreateNewGroupScreenState();
}

class _CreateNewGroupScreenState extends State<CreateNewGroupScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Contact> _filteredContacts = [];
  final Set<int> _selectedContacts = {};

  @override
  void initState() {
    super.initState();
    context.read<ContactBloc>().add(const ContactEvent(ContactParams()));
  }

  void _onSearchChanged(String query) {
    final contacts =
        (context.read<ContactBloc>().state as SuccessState).contacts;
    setState(() {
      _filteredContacts =
          contacts
              .where(
                (contact) =>
                    contact.username.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                    "${contact.name} ${contact.surname}".toLowerCase().contains(
                      query.toLowerCase(),
                    ),
              )
              .toList();
    });
  }

  void _toggleSelection(int contactId) {
    setState(() {
      if (_selectedContacts.contains(contactId)) {
        _selectedContacts.remove(contactId);
      } else {
        _selectedContacts.add(contactId);
      }
    });
  }

  void _createGroup() {
    final groupBloc = context.read<GroupBloc>();

    groupBloc.add(
      CreateGroupEvent(
        name: widget.groupName,
        memberIds: _selectedContacts.toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupBloc, GroupState>(
      listener: (context, state) {
        if (state is GroupCreatedState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(AppLocalizations.of(context)!.groupCreated)),
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: AppLocalizations.of(context)!.add,
          hasSearch: true,
          searchController: _searchController,
          onSearchChanged: _onSearchChanged,
          actions: [
            TextButton(onPressed: _createGroup, child: Text(AppLocalizations.of(context)!.done)),
          ],
        ),
        body: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SuccessState) {
              final contacts =
                  _searchController.text.isEmpty
                      ? state.contacts
                      : _filteredContacts;

              if (contacts.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.nothingFound),
                );
              }

              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  final isSelected = _selectedContacts.contains(contact.id);

                  return ListTile(
                    title: Row(
                      children: [
                        AvatarWidget(
                          avatarUrl: contact.avatar,
                          name: contact.name,
                          surname: contact.surname,
                          username: contact.username,
                          radius: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(contact.username),
                      ],
                    ),
                    onTap: () => _toggleSelection(contact.id),
                    trailing: GestureDetector(
                      onTap: () => _toggleSelection(contact.id),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey,
                            width: 2,
                          ),
                          color: Colors.transparent,
                        ),
                        child:
                            isSelected
                                ? const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                  size: 18,
                                )
                                : null,
                      ),
                    ),
                  );
                },
              );
            }

            return Center(
              child: Text(AppLocalizations.of(context)!.contactsLoadError),
            );
          },
        ),
      ),
    );
  }
}
