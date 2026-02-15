import 'package:quiz_app/core/l10n/app_localizations.dart';

/// Extension to provide helper methods for [AppLocalizations].
extension AppLocalizationsExtension on AppLocalizations {
  /// Returns the localized name of a language based on its [code].
  ///
  /// For example, if the current locale is English:
  /// - 'es' returns 'Spanish'
  /// - 'en' returns 'English'
  ///
  /// If the code is not found, it returns the code in uppercase.
  String getLanguageName(String code) {
    switch (code) {
      case 'es':
        return languageSpanish;
      case 'en':
        return languageEnglish;
      case 'fr':
        return languageFrench;
      case 'de':
        return languageGerman;
      case 'el':
        return languageGreek;
      case 'it':
        return languageItalian;
      case 'pt':
        return languagePortuguese;
      case 'ca':
        return languageCatalan;
      case 'eu':
        return languageBasque;
      case 'gl':
        return languageGalician;
      case 'hi':
        return languageHindi;
      case 'zh':
        return languageChinese;
      case 'ar':
        return languageArabic;
      case 'ja':
        return languageJapanese;
      case 'ko':
        return '한국어'; // Need to add to ARB if not present, but keeping fallback for now matching existing logic where possible or defaulting
      default:
        return code.toUpperCase();
    }
  }
}
