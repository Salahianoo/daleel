import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeState { light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme_mode';

  ThemeCubit() : super(ThemeState.light) {
    _loadTheme();
  }

  bool get isDarkMode => state == ThemeState.dark;

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(_themeKey) ?? false;
      emit(isDark ? ThemeState.dark : ThemeState.light);
    } catch (e) {
      // If there's an error loading, default to light theme
      emit(ThemeState.light);
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = state == ThemeState.light
        ? ThemeState.dark
        : ThemeState.light;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, newTheme == ThemeState.dark);
      emit(newTheme);
    } catch (e) {
      // If saving fails, still update the UI
      emit(newTheme);
    }
  }

  Future<void> setTheme(ThemeState theme) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, theme == ThemeState.dark);
      emit(theme);
    } catch (e) {
      // If saving fails, still update the UI
      emit(theme);
    }
  }
}
