import 'package:flutter/material.dart';
import 'package:voo_su/core/error/exceptions.dart';
import 'package:voo_su/presentation/screens/auth_screen/login_screen.dart';
import 'package:voo_su/presentation/screens/auth_screen/verify_screen.dart';
import 'package:voo_su/presentation/screens/chat_screen/chat_screen.dart';
import 'package:voo_su/presentation/screens/contact_screen/contact_screen.dart';

class AppRouter {
  static const String auth = '/';
  static const String verify = '/verify';
  static const String chats = '/chats';
  static const String contacts = '/contacts';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case verify:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case chats:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case contacts:
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      default:
        throw const RouteException('route not found');
    }
  }
}
