import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';

class AddGroupMembersScreen extends StatefulWidget {
  const AddGroupMembersScreen({super.key});

  @override
  State<AddGroupMembersScreen> createState() => _AddGroupMembersScreenState();
}

class _AddGroupMembersScreenState extends State<AddGroupMembersScreen> {
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
          contacts.where((contact) {
            final fullName = "${contact.name} ${contact.surname}".toLowerCase();
            return contact.username.toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                fullName.contains(query.toLowerCase());
          }).toList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Добавить",
        hasSearch: true,
        searchController: _searchController,
        onSearchChanged: _onSearchChanged,
        actions: [
          TextButton(
            onPressed: () {
              print("Добавить в группу: $_selectedContacts");
            },
            child: const Text(
              "Готово",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
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
              return const Center(child: Text("Ничего не найдено"));
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

          return const Center(child: Text("Ошибка загрузки контактов"));
        },
      ),
    );
  }
}
