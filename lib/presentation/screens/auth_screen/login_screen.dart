import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.verify,
            ModalRoute.withName(''),
          );
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 80),
            Center(
              child: Text(
                AppLocalizations.of(context)!.greeting,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.loginOrRegister,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                width: 343,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFADB5BD),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Email",
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
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size(327, 52),
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
          ],
        ),
      ),
    );
  }
}
