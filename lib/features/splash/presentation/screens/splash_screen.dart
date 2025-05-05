import 'package:flutter/material.dart';
import 'package:myapp/core/di/injectioin_container.dart';
import 'package:myapp/core/shared_prefs.dart';
import 'package:myapp/features/splash/presentation/widgets/info_widget.dart';
import 'package:myapp/features/todo/data/datasources/local_todo_datasouce.dart';
import 'package:myapp/features/todo/presentation/screens/todo_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _startTimer();
    });
  }

  Future<void> _startTimer() async {
    await Future.delayed(const Duration(seconds: 1), () {
      sl<LocalTodoDataSource>();
      SharedPrefs().setFirstTime(false);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget(),
    );
  }
}
