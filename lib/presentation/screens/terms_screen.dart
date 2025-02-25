import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/widgets/custom_app_bar_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: const CustomAppBar(title: "Правила"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 34),
            Text(
              AppLocalizations.of(context)!.termsText1,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.termsText2,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.termsText3,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
