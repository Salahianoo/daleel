import 'package:flutter/material.dart';

class I10n {
  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
  ];

  static String getTranslation(String key, BuildContext context) {
    // Implement your localization logic here
    return key;
  }
}
