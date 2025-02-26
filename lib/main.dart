import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:voo_su/core/injection.dart' as di;
import 'package:voo_su/core/router.dart';
import 'package:voo_su/core/theme/app_theme.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/cubit/chat_updates_cubit.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';
import 'package:voo_su/presentation/screens/splash_screen.dart';
import 'package:voo_su/presentation/screens/themes_screen/bloc/themes_bloc.dart';
import 'package:voo_su/presentation/screens/themes_screen/bloc/themes_state.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.messageId);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await Firebase.initializeApp();

  // https://firebase.google.com/docs/cloud-messaging/flutter/receive?hl=ru
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()),
        BlocProvider(create: (context) => di.sl<ChatBloc>()),
        BlocProvider(create: (context) => di.sl<ContactBloc>()),
        BlocProvider(create: (context) => di.sl<MessageBloc>()),
        BlocProvider(create: (context) => di.sl<SettingsBloc>()),
        BlocProvider(create: (context) => di.sl<ThemesBloc>()),
        BlocProvider(create: (context) => di.sl<ChatUpdatesCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedOutState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.auth,
              (route) => false,
            );
          }
        },
        child: BlocBuilder<ThemesBloc, ThemesState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'VooSu',
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              onGenerateRoute: AppRouter.onGenerateRoute,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('ru')],
              theme:
                  state is ThemesLightState
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme,
            );
          },
        ),
      ),
    );
  }
}
