import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? titleWidget;

  final List<Widget>? actions;
  final bool hasSearch;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onTap;

  const CustomAppBar({
    super.key,
    this.titleText,
    this.titleWidget,
    this.actions,
    this.hasSearch = false,
    this.searchController,
    this.onSearchChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appBarColors = Theme.of(context).appBarTheme;
    final colors = Theme.of(context).colorScheme;

    return PreferredSize(
      preferredSize: Size.fromHeight(hasSearch ? 120 : kToolbarHeight),
      child: GestureDetector(
        onTap: onTap,
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
          title:
              titleWidget ??
              (titleText != null
                  ? Text(
                    titleText!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: colors.onSurface,
                    ),
                  )
                  : const SizedBox.shrink()),
          actions: actions,
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hasSearch ? 120 : kToolbarHeight);
}
