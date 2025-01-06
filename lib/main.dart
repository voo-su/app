import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/injection.dart' as di;
import 'package:voo_su/core/presentation//theme/app_theme.dart';
import 'package:voo_su/core/router.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.auth,
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'Voo.su',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
