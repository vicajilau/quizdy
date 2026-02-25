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
import 'package:quizlab_ai/core/constants/question_constants.dart';

/// Utility class for translating question-related content in the presentation layer
class QuestionTranslationHelper {
  /// Translates option text from data layer to presentation layer
  /// This handles the translation of True/False options from the model to localized strings
  static String translateOption(String option, AppLocalizations localizations) {
    switch (option) {
      case QuestionConstants.defaultTrueOption:
        return localizations.trueLabel;
      case QuestionConstants.defaultFalseOption:
        return localizations.falseLabel;
      default:
        return option; // Return as-is for custom options
    }
  }
}
