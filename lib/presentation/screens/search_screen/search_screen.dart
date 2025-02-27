import 'package:flutter/material.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(
        title: "Поиск",
        hasSearch: true,
        searchController: _searchController,
        onSearchChanged: (value) {
          print("Поиск: $value");
        },
      ),
      body: Center(
        child: Text(
          "Поиск по имени пользователя",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
