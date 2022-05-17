import 'package:bloc/bloc.dart';
import 'package:boilerplate/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeMode _currentTheme = ThemeMode.dark;
  Locale _currentLocale = const Locale("en");
  final LocalStorage _localStorage = LocalStorage();

  ThemeCubit()
      : super(
          CurrentTheme(ThemeMode.dark, const Locale("en")),
        );

  void init() {
    _getSavedTheme();
    _localStorage.init();
  }

  void _getSavedTheme() async {
    final isDark = await _localStorage.getTheme();
    final locale = await _localStorage.getLocale();

    debugPrint(locale);
    if (!isDark) {
      _currentTheme = ThemeMode.light;
    }

    _currentLocale = Locale(locale);

    emit(CurrentTheme(_currentTheme, _currentLocale));
  }

  Future<void> changeTheme() async {
    if (_currentTheme == ThemeMode.dark) {
      _currentTheme = ThemeMode.light;

      await _localStorage.setTheme(false);
      emit(CurrentTheme(_currentTheme, _currentLocale));
    } else {
      _currentTheme = ThemeMode.dark;
      await _localStorage.setTheme(true);
      emit(CurrentTheme(_currentTheme, _currentLocale));
    }
  }

  Future<void> changeLocale(String lang) async {
    _currentLocale = Locale(lang);

    await _localStorage.setLocale(lang);

    emit(CurrentTheme(_currentTheme, _currentLocale));
  }
}
