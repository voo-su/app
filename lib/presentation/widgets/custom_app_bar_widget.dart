import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasSearch;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hasSearch = false,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final appBarColors = Theme.of(context).appBarTheme;
    final colors = Theme.of(context).colorScheme;

    return PreferredSize(
      preferredSize: Size.fromHeight(hasSearch ? 120 : kToolbarHeight),
      child: AppBar(
        backgroundColor: appBarColors.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading:
            Navigator.of(context).canPop()
                ? IconButton(
                  icon: Icon(Icons.arrow_back, color: colors.onSurface),
                  onPressed: () => Navigator.of(context).pop(),
                )
                : null,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: colors.onSurface,
          ),
        ),
        centerTitle: false,
        flexibleSpace:
            hasSearch
                ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 56,
                      left: 16,
                      right: 16,
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: onSearchChanged,
                      decoration: InputDecoration(
                        hintText: "Поиск...",
                        hintStyle: TextStyle(color: colors.inverseSurface),
                        filled: true,
                        fillColor: colors.surfaceContainerHighest,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: colors.inverseSurface,
                        ),
                      ),
                    ),
                  ),
                )
                : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hasSearch ? 120 : kToolbarHeight);
}
