import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voo_su/core/theme/colors.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/core/router.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/screens/auth_screen/login_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController otpController = TextEditingController();

  late Timer _timer;
  int _secondsRemaining = 120;
  bool _isExpired = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 120;
      _isExpired = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isExpired = true;
        });
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRouter.chats, ModalRoute.withName(''));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightPrimarySurface,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.enterCodeBelow,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _isExpired ? Colors.grey : const Color(0xFFADB5BD),
                      width: 1,
                    ),
                    color: _isExpired ? Colors.grey[300] : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      enabled: !_isExpired,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _isExpired ? Colors.grey : Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Введите код",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color:
                              _isExpired
                                  ? Colors.grey
                                  : const Color(0xFFADB5BD),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _isExpired
                      ? "Истекло время для подтверждения"
                      : "Вы сможете отправить код повторно через $_secondsRemaining сек.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.lightPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed:
                        _isExpired
                            ? () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                            : () {
                              print("Подтверждение кода");
                              context.read<AuthBloc>().add(
                                VerifyEvent(code: otpController.text),
                              );
                            },
                    child: Text(
                      _isExpired
                          ? "Повторить"
                          : AppLocalizations.of(context)!.confirm,
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
        ),
      ),
    );
  }
}
