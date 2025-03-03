import 'package:flutter/material.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_screen.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_screen.dart';
import 'package:voo_su/presentation/screens/settings_screen/settings_screen.dart';
import 'package:voo_su/presentation/screens/test_screen.dart';

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
    // SearchScreen(),s
    SettingsScreen(),

    TestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        backgroundColor: colors.surface,
        indicatorColor: colors.surface,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(
            label: AppLocalizations.of(context)!.chats,
            icon: Icon(Icons.forum, color: colors.onPrimaryContainer),
          ),
          NavigationDestination(
            label: AppLocalizations.of(context)!.contacts,
            icon: Icon(Icons.people, color: colors.onPrimaryContainer),
          ),
          // NavigationDestination(
          //   label: "Поиск",
          //   icon: Icon(Icons.person_search, color: colors.onPrimaryContainer),
          // ),
          NavigationDestination(
            label: AppLocalizations.of(context)!.settings,
            icon: Icon(Icons.settings, color: colors.onPrimaryContainer),
          ),
          NavigationDestination(
            label: "test",
            icon: Icon(
              Icons.u_turn_left_rounded,
              color: colors.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
