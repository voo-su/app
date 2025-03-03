import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/router.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String avatarUrl = "";
  String username = "";
  String name = "";
  String surname = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(GetAccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.settings),
      body: SafeArea(
        child: BlocListener<SettingsBloc, SettingsState>(
          listener: (context, state) {
            if (state is SettingsSuccessState) {
              setState(() {
                username = state.account.username;
                name = state.account.name;
                surname = state.account.surname;
                avatarUrl =
                    state.account.avatar.isNotEmpty ? state.account.avatar : "";
                email = state.account.email;
              });
            }
            if (state is SettingsErrorState) {
              print("Ошибка: ${state.failure}");
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    AvatarWidget(
                      avatarUrl: avatarUrl,
                      name: name,
                      surname: surname,
                      username: username,
                      radius: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: colors.onSurface,
                            ),
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.editProfile);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: colors.surface,
                        foregroundColor: colors.onSurface,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        "Изменить",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Важное",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingsItem(
                icon: Icons.notifications_none_outlined,
                title: "Уведомления",
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.notifications);
                },
              ),
              _buildSettingsItem(
                icon: Icons.palette_outlined,
                title: "Оформление",
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.themes);
                },
              ),
              _buildSettingsItem(
                icon: Icons.logout_outlined,
                title: "Выйти",
                onTap: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                  Navigator.popAndPushNamed(context, AppRouter.auth);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: colors.primary, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: colors.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
