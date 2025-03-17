import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/presentation/screens/chat_screen/choose_name_group_screen.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class CreateNewChatScreen extends StatefulWidget {
  const CreateNewChatScreen({super.key});

  @override
  State<CreateNewChatScreen> createState() => _CreateNewChatScreenState();
}

class _CreateNewChatScreenState extends State<CreateNewChatScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Contact> _filteredContacts = [];

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

  void _navigateToCreateGroup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseNameGroupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Выберите контакт",
        hasSearch: true,
        searchController: _searchController,
        onSearchChanged: _onSearchChanged,
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.group_add),
            title: const Text("Создать группу"),
            onTap: _navigateToCreateGroup,
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
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
                      return ListTile(
                        leading: AvatarWidget(
                          avatarUrl: contact.avatar,
                          name: contact.name,
                          surname: contact.surname,
                          username: contact.username,
                          radius: 20,
                        ),
                        title: Text(contact.username),
                        onTap: () {
                          print("контакт для чата");
                        },
                      );
                    },
                  );
                }

                return const Center(child: Text("Ошибка загрузки контактов"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
