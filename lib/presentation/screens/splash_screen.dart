import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/presentation/screens/auth_screen/login_screen.dart';
import 'package:voo_su/presentation/screens/home_screen.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();

    bool isAuthenticated = prefs.getBool(authKey) ?? false;

    Timer(const Duration(seconds: 3), () {
      if (isAuthenticated) {
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Image(
              width: 200,
              height: 200,
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(
              "VooSu (voo.su)",
              style: TextStyle(
                color: const Color(0xFF2a2a2a),
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
