// Copyright (C) 2026 Víctor Carreras
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:quizlab_ai/core/l10n/app_localizations.dart';

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
