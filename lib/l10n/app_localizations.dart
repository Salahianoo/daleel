import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Daleel'**
  String get appTitle;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @preferredLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Preferred Language'**
  String get preferredLanguage;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @changeLanguageConfirm.
  ///
  /// In en, this message translates to:
  /// **'Do you want to change the language?'**
  String get changeLanguageConfirm;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed successfully'**
  String get languageChanged;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @educationalGuide.
  ///
  /// In en, this message translates to:
  /// **'Educational Guide'**
  String get educationalGuide;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @advertisingServices.
  ///
  /// In en, this message translates to:
  /// **'Advertising Services'**
  String get advertisingServices;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @switchToDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark theme'**
  String get switchToDarkTheme;

  /// No description provided for @switchToLightTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch to light theme'**
  String get switchToLightTheme;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get about;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @privateUniversities.
  ///
  /// In en, this message translates to:
  /// **'Private Universities'**
  String get privateUniversities;

  /// No description provided for @universityMap.
  ///
  /// In en, this message translates to:
  /// **'University Map'**
  String get universityMap;

  /// No description provided for @firstTenResults.
  ///
  /// In en, this message translates to:
  /// **'First Ten Results'**
  String get firstTenResults;

  /// No description provided for @mostVisited.
  ///
  /// In en, this message translates to:
  /// **'Most Visited'**
  String get mostVisited;

  /// No description provided for @lowestFees.
  ///
  /// In en, this message translates to:
  /// **'Lowest Fees'**
  String get lowestFees;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get newest;

  /// No description provided for @minimumGrade.
  ///
  /// In en, this message translates to:
  /// **'Minimum Grade for Admission'**
  String get minimumGrade;

  /// No description provided for @verifiedInfo.
  ///
  /// In en, this message translates to:
  /// **'Information verified by university'**
  String get verifiedInfo;

  /// No description provided for @bachelorDegree.
  ///
  /// In en, this message translates to:
  /// **'Bachelor\'s Degree'**
  String get bachelorDegree;

  /// No description provided for @specializations.
  ///
  /// In en, this message translates to:
  /// **'specializations'**
  String get specializations;

  /// No description provided for @creditHours.
  ///
  /// In en, this message translates to:
  /// **'credit hours'**
  String get creditHours;

  /// No description provided for @transportation.
  ///
  /// In en, this message translates to:
  /// **'Transportation available'**
  String get transportation;

  /// No description provided for @creditHourPrice.
  ///
  /// In en, this message translates to:
  /// **'Credit hour starts from'**
  String get creditHourPrice;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout'**
  String get confirmLogout;

  /// No description provided for @logoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @shamsiehEducation.
  ///
  /// In en, this message translates to:
  /// **'Shamsieh Education'**
  String get shamsiehEducation;

  /// No description provided for @educationalPlatform.
  ///
  /// In en, this message translates to:
  /// **'Educational Platform'**
  String get educationalPlatform;

  /// Advertisement service main title
  ///
  /// In en, this message translates to:
  /// **'Choose the right ad or subscription'**
  String get chooseAdOrSubscription;

  /// No description provided for @marketingServices.
  ///
  /// In en, this message translates to:
  /// **'Benefit from our technical and advertising services to market your institution professionally and increase views and registrations!'**
  String get marketingServices;

  /// No description provided for @specialOffer.
  ///
  /// In en, this message translates to:
  /// **'Special Offer'**
  String get specialOffer;

  /// No description provided for @homePageAd.
  ///
  /// In en, this message translates to:
  /// **'Home Page Advertisement'**
  String get homePageAd;

  /// No description provided for @firstAd.
  ///
  /// In en, this message translates to:
  /// **'First Advertisement'**
  String get firstAd;

  /// No description provided for @featuredAd.
  ///
  /// In en, this message translates to:
  /// **'Featured Advertisement'**
  String get featuredAd;

  /// No description provided for @digitalPromotionPackage.
  ///
  /// In en, this message translates to:
  /// **'Digital Promotion Package'**
  String get digitalPromotionPackage;

  /// No description provided for @digitalPresencePackage.
  ///
  /// In en, this message translates to:
  /// **'Digital Presence Package'**
  String get digitalPresencePackage;

  /// No description provided for @comprehensiveAd.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Advertisement'**
  String get comprehensiveAd;

  /// No description provided for @planDetails.
  ///
  /// In en, this message translates to:
  /// **'Plan Details'**
  String get planDetails;

  /// No description provided for @planDescription.
  ///
  /// In en, this message translates to:
  /// **'This plan allows you to display your ad in a prominent location on the app\'s home page, ensuring you reach the largest number of users.'**
  String get planDescription;

  /// No description provided for @threeDays.
  ///
  /// In en, this message translates to:
  /// **'3 Days'**
  String get threeDays;

  /// No description provided for @sevenDays.
  ///
  /// In en, this message translates to:
  /// **'7 Days'**
  String get sevenDays;

  /// No description provided for @fourteenDays.
  ///
  /// In en, this message translates to:
  /// **'14 Days'**
  String get fourteenDays;

  /// No description provided for @dinar.
  ///
  /// In en, this message translates to:
  /// **'Dinar'**
  String get dinar;

  /// No description provided for @subscribeNow.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get subscribeNow;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon...'**
  String get comingSoon;

  /// Home screen categories section
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get university;

  /// No description provided for @school.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get school;

  /// No description provided for @nursery.
  ///
  /// In en, this message translates to:
  /// **'Nursery'**
  String get nursery;

  /// No description provided for @kindergarten.
  ///
  /// In en, this message translates to:
  /// **'Kindergarten'**
  String get kindergarten;

  /// No description provided for @college.
  ///
  /// In en, this message translates to:
  /// **'College'**
  String get college;

  /// No description provided for @needs.
  ///
  /// In en, this message translates to:
  /// **'Needs'**
  String get needs;

  /// No description provided for @specialOffers.
  ///
  /// In en, this message translates to:
  /// **'Special Offers'**
  String get specialOffers;

  /// No description provided for @events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @trainingCourses.
  ///
  /// In en, this message translates to:
  /// **'Training Courses'**
  String get trainingCourses;

  /// No description provided for @jobs.
  ///
  /// In en, this message translates to:
  /// **'Job Vacancies'**
  String get jobs;

  /// No description provided for @scholarships.
  ///
  /// In en, this message translates to:
  /// **'Scholarships'**
  String get scholarships;

  /// No description provided for @volunteerWork.
  ///
  /// In en, this message translates to:
  /// **'Volunteer Work'**
  String get volunteerWork;

  /// University action buttons section
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @numberOfSpecializations.
  ///
  /// In en, this message translates to:
  /// **'Number of specializations'**
  String get numberOfSpecializations;

  /// No description provided for @minimumCreditHours.
  ///
  /// In en, this message translates to:
  /// **'Minimum credit hours'**
  String get minimumCreditHours;

  /// No description provided for @transportationDetails.
  ///
  /// In en, this message translates to:
  /// **'Transportation available: Amman, Balqa, Zarqa, Jerash'**
  String get transportationDetails;

  /// No description provided for @phoneNumbers.
  ///
  /// In en, this message translates to:
  /// **'0799024000 | 064791400'**
  String get phoneNumbers;

  /// No description provided for @creditHourStartsFrom.
  ///
  /// In en, this message translates to:
  /// **'Credit hour starts from 12 JD'**
  String get creditHourStartsFrom;

  /// No description provided for @campusLocation.
  ///
  /// In en, this message translates to:
  /// **'Campus: Ain Al-Basha, Jordan Street - Mobss area'**
  String get campusLocation;

  /// No description provided for @distanceFromCapital.
  ///
  /// In en, this message translates to:
  /// **'12 km north of the capital Amman'**
  String get distanceFromCapital;

  /// University names section
  ///
  /// In en, this message translates to:
  /// **'Amman Ahlia University'**
  String get ammanAhliaUniversity;

  /// No description provided for @ammanArabUniversity.
  ///
  /// In en, this message translates to:
  /// **'Amman Arab University'**
  String get ammanArabUniversity;

  /// No description provided for @irbidNationalUniversity.
  ///
  /// In en, this message translates to:
  /// **'Irbid National University'**
  String get irbidNationalUniversity;

  /// No description provided for @americanUniversityMadaba.
  ///
  /// In en, this message translates to:
  /// **'American University of Madaba'**
  String get americanUniversityMadaba;

  /// Location information section
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @locationInfo.
  ///
  /// In en, this message translates to:
  /// **'Location Information'**
  String get locationInfo;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInfo;

  /// No description provided for @yourLocation.
  ///
  /// In en, this message translates to:
  /// **'Your Location'**
  String get yourLocation;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocation;

  /// No description provided for @locationFound.
  ///
  /// In en, this message translates to:
  /// **'Location found!'**
  String get locationFound;

  /// No description provided for @locationServiceDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location service is disabled'**
  String get locationServiceDisabled;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get locationPermissionDenied;

  /// No description provided for @couldNotGetLocation.
  ///
  /// In en, this message translates to:
  /// **'Could not get location data'**
  String get couldNotGetLocation;

  /// No description provided for @errorGettingLocation.
  ///
  /// In en, this message translates to:
  /// **'Error getting location'**
  String get errorGettingLocation;

  /// App version information
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// No description provided for @shamsiehEducationalApp.
  ///
  /// In en, this message translates to:
  /// **'Shamsieh Educational App'**
  String get shamsiehEducationalApp;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
