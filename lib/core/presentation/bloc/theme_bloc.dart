import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/shared_prefs.dart';
import 'theme_events.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(SharedPrefs().theme) {
    on<ToggleThemeEvent>((event, emit) {
      final newTheme = state == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
      emit(newTheme);
    });
  }
}
