import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool privateChats = true;
  bool groups = true;

  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(GetNotifySettingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.notifications,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SettingsNotifySettingsState) {
              privateChats = state.privateChatsSettings.muteUntil == 0;
              groups = state.groupChatsSettings.muteUntil == 0;

              print("Личные чаты: ${state.privateChatsSettings}");
              print("Группы: ${state.groupChatsSettings}");

              return Column(
                children: [
                  _buildSwitchTile(
                    title:  AppLocalizations.of(context)!.personalChats,
                    value: privateChats,
                    onChanged: (val) {
                      setState(() => privateChats = val);
                      print("Изменение уведомлений для чатов: $val");
                    },
                  ),
                  _buildSwitchTile(
                    title: AppLocalizations.of(context)!.groups,
                    value: groups,
                    onChanged: (val) {
                      setState(() => groups = val);
                      print("Изменение уведомлений для групп: $val");
                    },
                  ),
                ],
              );
            }
            return Center(child: Text(AppLocalizations.of(context)!.dataLoadError));
          },
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: colors.onSurface)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: colors.primary,
            inactiveThumbColor: colors.inverseSurface,
            inactiveTrackColor: colors.surfaceContainerHighest,
          ),
        ],
      ),
    );
  }
}
