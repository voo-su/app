import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_screen.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    ChatScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.lightPrimarySurface,
        indicatorColor: AppColors.lightPrimaryContainer,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(
            label: AppLocalizations.of(context)!.chats,
            icon: const Icon(Icons.message),
          ),
          NavigationDestination(
            label: AppLocalizations.of(context)!.contacts,
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
