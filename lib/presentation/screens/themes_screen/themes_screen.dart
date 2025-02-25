import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/presentation/screens/themes_screen/bloc/themes_bloc.dart';
import 'package:voo_su/presentation/screens/themes_screen/bloc/themes_event.dart';
import 'package:voo_su/presentation/screens/themes_screen/bloc/themes_state.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class ThemesScreen extends StatelessWidget {
  const ThemesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: const CustomAppBar(title: "Оформление"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Выберите тему",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colors.onSurface,
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<ThemesBloc, ThemesState>(
              builder: (context, state) {
                bool isLightTheme = state is ThemesLightState;
                return _buildThemeSwitch(context, isLightTheme);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSwitch(BuildContext context, bool isLightTheme) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        context.read<ThemesBloc>().add(ThemesChanged(!isLightTheme));
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: colors.surfaceVariant,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment:
                  isLightTheme ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: colors.background,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildThemeText("Светлая", isLightTheme, colors.onSurface),
                _buildThemeText("Темная", !isLightTheme, colors.onSurface),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeText(String text, bool isActive, Color color) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ),
    );
  }
}
