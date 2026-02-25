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

import 'package:flutter/material.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';

/// Enumeration representing the different types of questions available in a quiz.
enum QuestionType {
  /// Multiple choice question where multiple answers can be selected.
  multipleChoice('multiple_choice'),

  /// Single choice question where only one answer can be selected.
  singleChoice('single_choice'),

  /// True or false question.
  trueFalse('true_false'),

  /// Essay question requiring a written response.
  essay('essay');

  const QuestionType(this.value);

  /// The string value used for serialization/deserialization.
  final String value;

  /// Creates a QuestionType from a string value.
  ///
  /// Returns [QuestionType.multipleChoice] as default if the value is not recognized.
  static QuestionType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'multiple_choice':
        return QuestionType.multipleChoice;
      case 'single_choice':
        return QuestionType.singleChoice;
      case 'true_false':
        return QuestionType.trueFalse;
      case 'essay':
        return QuestionType.essay;
      default:
        return QuestionType.multipleChoice; // Default fallback
    }
  }

  /// Converts the QuestionType to its string representation for serialization.
  String toJson() => value;

  @override
  String toString() => value;

  /// Returns an icon representing the question type.
  /// Uses the [Icons] class to provide a visual representation.
  ///
  /// Returns an [IconData] corresponding to the question type.
  IconData getQuestionTypeIcon() {
    switch (this) {
      case QuestionType.multipleChoice:
        return Icons.checklist;
      case QuestionType.singleChoice:
        return Icons.radio_button_checked;
      case QuestionType.trueFalse:
        return Icons.toggle_on;
      case QuestionType.essay:
        return Icons.article;
    }
  }

  /// Returns a localized label for the question type.
  /// Uses the provided [BuildContext] to access localization resources.
  ///
  /// Returns a string that describes the question type.
  String getQuestionTypeLabel(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (this) {
      case QuestionType.multipleChoice:
        return localizations.questionTypeMultipleChoice;
      case QuestionType.singleChoice:
        return localizations.questionTypeSingleChoice;
      case QuestionType.trueFalse:
        return localizations.questionTypeTrueFalse;
      case QuestionType.essay:
        return localizations.questionTypeEssay;
    }
  }
}
