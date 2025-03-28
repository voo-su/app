import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/core/router.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRouter.verify, ModalRoute.withName(''));
        }
      },
      child: Scaffold(
        backgroundColor: colors.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.greeting,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.loginOrRegister,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: colors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            enableSuggestions: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.email,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFADB5BD),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: colors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginEvent(email: emailController.text),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFF7F7FC),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colors.onSurfaceVariant,
                    ),
                    children: [
                      TextSpan(text: AppLocalizations.of(context)!.acceptTerms),
                      TextSpan(
                        text: AppLocalizations.of(context)!.termsOfUse,
                        style: TextStyle(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, AppRouter.terms);
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
