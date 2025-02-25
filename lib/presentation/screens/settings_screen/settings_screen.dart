import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';
import 'package:voo_su/presentation/widgets/avatar_widget.dart';

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
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: const TextStyle(
            color: Color(0xff070508),
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightOnSurface20,
                            ),
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        print("Открыть экран редактирования профиля");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.lightPrimaryContainer,
                        foregroundColor: AppColors.lightOnSurface20,
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
                    color: AppColors.lightPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingsItem(
                icon: Icons.notifications_none_outlined,
                title: "Уведомления",
                onTap: () {
                  print("Открыть настройки уведомлений");
                },
              ),
              _buildSettingsItem(
                icon: Icons.palette_outlined,
                title: "Оформление",
                onTap: () {
                  print("Открыть настройки оформления");
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.lightPrimary, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: AppColors.lightOnSurface20),
            ),
          ],
        ),
      ),
    );
  }
}
