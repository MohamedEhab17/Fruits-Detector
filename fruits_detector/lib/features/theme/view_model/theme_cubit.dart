import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light)) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false; 
    emit(ThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isCurrentlyDark = state.themeMode == ThemeMode.dark;
    final newThemeMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;

    await prefs.setBool('isDark', newThemeMode == ThemeMode.dark);

    emit(ThemeState(themeMode: newThemeMode));
  }
}
