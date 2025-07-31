import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageState {
  final Locale locale;
  final TextDirection textDirection;

  const LanguageState({required this.locale, required this.textDirection});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageState &&
          runtimeType == other.runtimeType &&
          locale == other.locale &&
          textDirection == other.textDirection;

  @override
  int get hashCode => locale.hashCode ^ textDirection.hashCode;
}

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
    : super(
        const LanguageState(
          locale: Locale('ar'),
          textDirection: TextDirection.rtl,
        ),
      ) {
    _loadSavedLanguage();
  }

  static const String _languageKey = 'selected_language';

  TextDirection _getTextDirection(String languageCode) {
    return languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }

  void _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString(_languageKey) ?? 'ar';
      print('Loading saved language: $savedLanguage');
      emit(
        LanguageState(
          locale: Locale(savedLanguage),
          textDirection: _getTextDirection(savedLanguage),
        ),
      );
    } catch (e) {
      print('Error loading language, defaulting to Arabic: $e');
      emit(
        const LanguageState(
          locale: Locale('ar'),
          textDirection: TextDirection.rtl,
        ),
      ); // Fallback to Arabic
    }
  }

  void changeLanguage(String languageCode) async {
    try {
      print('Changing language to: $languageCode');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, languageCode);
      emit(
        LanguageState(
          locale: Locale(languageCode),
          textDirection: _getTextDirection(languageCode),
        ),
      );
      print('Language changed to: $languageCode');
    } catch (e) {
      print('Error changing language: $e');
    }
  }

  String get currentLanguageCode => state.locale.languageCode;
  Locale get currentLocale => state.locale;
  TextDirection get currentTextDirection => state.textDirection;

  // Text alignment based on language direction
  TextAlign get textAlign => isArabic ? TextAlign.right : TextAlign.left;
  TextAlign get oppositeTextAlign =>
      isArabic ? TextAlign.left : TextAlign.right;

  // Alignment for widgets
  Alignment get startAlignment =>
      isArabic ? Alignment.centerRight : Alignment.centerLeft;
  Alignment get endAlignment =>
      isArabic ? Alignment.centerLeft : Alignment.centerRight;

  // CrossAxisAlignment for rows and columns
  CrossAxisAlignment get crossAxisStart =>
      isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  CrossAxisAlignment get crossAxisEnd =>
      isArabic ? CrossAxisAlignment.start : CrossAxisAlignment.end;

  // MainAxisAlignment for centering content
  MainAxisAlignment get mainAxisStart =>
      isArabic ? MainAxisAlignment.end : MainAxisAlignment.start;
  MainAxisAlignment get mainAxisEnd =>
      isArabic ? MainAxisAlignment.start : MainAxisAlignment.end;

  bool get isArabic => state.locale.languageCode == 'ar';
  bool get isEnglish => state.locale.languageCode == 'en';
}
