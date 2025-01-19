import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voo_su/core/router.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/widgets/otp_text_field.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.chats,
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
                AppLocalizations.of(context)!.enterCode,
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
                    AppLocalizations.of(context)!.enterCodeBelow,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtpTextField(otpController: otp1Controller),
                  OtpTextField(otpController: otp2Controller),
                  OtpTextField(otpController: otp3Controller),
                  OtpTextField(otpController: otp4Controller),
                  OtpTextField(otpController: otp5Controller),
                  OtpTextField(otpController: otp6Controller),
                ],
              ),
            ),
            const SizedBox(height: 77),
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
                      VerifyEvent(code: otp1Controller.text +
                        otp2Controller.text +
                        otp3Controller.text +
                        otp4Controller.text +
                        otp5Controller.text +
                        otp6Controller.text,
                  ),);
                },
                child: Text(
                  AppLocalizations.of(context)!.confirm,
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
