class AppConstants {
  // API
  static const String baseUrl = 'https://your-api-base-url.com/api';
  static const String apiKey = 'AIzaSyD9emtZq71D6H1WRAkfrUu1B0ZprBQ0Dd0';

  // SharedPreferences Keys
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String userTokenKey = 'user_token';
  static const String isFirstTimeKey = 'is_first_time';

  // App Info
  static const String appName = 'Daleel';
  static const String appVersion = '1.0.0';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Supported Languages
  static const List<String> supportedLanguages = ['ar', 'en'];
  static const String defaultLanguage = 'ar';
}
