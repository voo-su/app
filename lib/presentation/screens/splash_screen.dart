import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/domain/usecases/account/get_firebase_token_usecase.dart';
import 'package:voo_su/presentation/screens/auth_screen/login_screen.dart';
import 'package:voo_su/presentation/screens/home_screen.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.requestPermission();

    _checkAuthStatus();

    _firebaseMessaging.getToken().then((token) {
      if (token != null) {
        print("FCM Token: $token");
        _sendFirebaseToken(token);
      }
    });
  }

  void _sendFirebaseToken(String token) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final useCase = context.read<GetFirebaseTokenUseCase>();
      useCase(token).then((result) {
        result.fold(
          (failure) => print("Ошибка при регистрации FCM-токена"),
          (success) => print(success),
        );
      });
    });
  }

  void _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 3), () {
      String? token = prefs.getString(authKey);
      if (token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(
              "VooSu (voo.su)",
              style: TextStyle(
                color: colors.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
