import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/presentation/bloc/theme_bloc.dart';
import 'package:myapp/core/shared_prefs.dart';
import 'package:myapp/core/theme/app_themes.dart';
import 'package:myapp/features/splash/presentation/screens/splash_screen.dart';
import 'package:myapp/features/todo/presentation/bloc/todo/todo_bloc.dart';
import 'core/di/injectioin_container.dart' as di;
import 'package:myapp/features/todo/presentation/screens/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection init
  await di.init();

  // Shared Prefs Init
  await SharedPrefs().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => di.sl<ThemeBloc>()),
        BlocProvider<TodoBloc>(create: (context) => di.sl<TodoBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        bloc: di.sl<ThemeBloc>(),
        builder: (context, state) {
          return MaterialApp(
            title: 'ToDo Demo',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state,
            home:
                SharedPrefs().getFirstTime
                    ? const SplashScreen()
                    : const HomeScreen(),
          );
        },
      ),
    );
  }
}
