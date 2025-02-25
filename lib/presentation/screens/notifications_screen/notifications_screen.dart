import 'package:flutter/material.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool privateChats = true;
  bool groups = true;
  bool doNotDisturb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: const CustomAppBar(title: "Уведомления"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            _buildSwitchTile(
              title: "Приватные чаты",
              value: privateChats,
              onChanged: (val) => setState(() => privateChats = val),
            ),
            _buildSwitchTile(
              title: "Группы",
              value: groups,
              onChanged: (val) => setState(() => groups = val),
            ),
            _buildSwitchTile(
              title: "Не беспокоить",
              value: doNotDisturb,
              onChanged: (val) => setState(() => doNotDisturb = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.lightOnSurface20,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: AppColors.lightPrimary,
            inactiveThumbColor: AppColors.lightOnSurface60,
            inactiveTrackColor: AppColors.lightSecondarySurface,
          ),
        ],
      ),
    );
  }
}
