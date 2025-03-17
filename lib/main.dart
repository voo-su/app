import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:voo_su/core/chat_updates_listener.dart';
import 'package:voo_su/core/injection.dart' as di;
import 'package:voo_su/core/router.dart';
import 'package:voo_su/core/theme/app_theme.dart';
import 'package:voo_su/domain/usecases/account/get_firebase_token_usecase.dart';
import 'package:voo_su/generated/firebase_options.dart';
import 'package:voo_su/generated/l10n/app_localizations.dart';
import 'package:voo_su/presentation/cubit/chat_updates_cubit.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/group_chat_screen/bloc/group_info_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';
import 'package:voo_su/presentation/screens/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.messageId);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // https://firebase.google.com/docs/cloud-messaging/flutter/receive?hl=ru
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ChatUpdatesListener chatUpdatesListener;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatUpdatesListener = ChatUpdatesListener(
        chatUpdatesCubit: di.sl<ChatUpdatesCubit>(),
        messageBloc: di.sl<MessageBloc>(),
      );
    });
  }

  @override
  void dispose() {
    chatUpdatesListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()),
        BlocProvider(create: (context) => di.sl<ChatBloc>()),
        BlocProvider(create: (context) => di.sl<ContactBloc>()),
        BlocProvider(create: (context) => di.sl<MessageBloc>()),
        BlocProvider(create: (context) => di.sl<SettingsBloc>()),
        BlocProvider(create: (context) => di.sl<GroupInfoBloc>()),
        BlocProvider(create: (context) => di.sl<ChatUpdatesCubit>()),

        Provider(create: (context) => di.sl<GetFirebaseTokenUseCase>()),
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
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            bool isLightTheme = state is SettingsLightThemeState;

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
              theme: isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme,
            );
          },
        ),
      ),
    );
  }
}
