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
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String? questionTextError;

  bool validateQuestionText(String text, AppLocalizations localizations) {
    if (text.trim().isEmpty) {
      setState(() {
        questionTextError = localizations.questionTextRequired;
      });
      return false;
    }

    setState(() {
      questionTextError = null;
    });
    return true;
  }

  bool validateOptions({
    required QuestionType questionType,
    required List<TextEditingController> optionControllers,
    required List<bool> correctAnswers,
    required AppLocalizations localizations,
    required ValueNotifier<String?> optionsErrorNotifier,
  }) {
    // Clear previous errors
    optionsErrorNotifier.value = null;

    // Skip validation for essay questions
    if (questionType == QuestionType.essay) {
      return true;
    }

    // Check for empty options
    List<int> emptyOptionIndexes = [];
    for (int i = 0; i < optionControllers.length; i++) {
      if (optionControllers[i].text.trim().isEmpty) {
        emptyOptionIndexes.add(i + 1); // +1 for human-readable numbering
      }
    }

    // If there are empty options, show specific error message
    if (emptyOptionIndexes.isNotEmpty) {
      if (emptyOptionIndexes.length == 1) {
        optionsErrorNotifier.value = localizations.emptyOptionError(
          emptyOptionIndexes.first.toString(),
        );
      } else {
        optionsErrorNotifier.value = localizations.emptyOptionsError(
          emptyOptionIndexes.join(', '),
        );
      }
      return false;
    }

    // Check if at least one correct answer is selected
    bool hasCorrectAnswer = correctAnswers.any((answer) => answer);
    if (!hasCorrectAnswer) {
      optionsErrorNotifier.value =
          localizations.atLeastOneCorrectAnswerRequired;
      return false;
    }

    // Validate specific question types
    if (questionType == QuestionType.singleChoice ||
        questionType == QuestionType.trueFalse) {
      int correctCount = correctAnswers.where((answer) => answer).length;
      if (correctCount > 1) {
        optionsErrorNotifier.value = localizations.onlyOneCorrectAnswerAllowed;
        return false;
      }
    }

    return true;
  }

  bool validateForm({
    required String questionText,
    required QuestionType questionType,
    required List<TextEditingController> optionControllers,
    required List<bool> correctAnswers,
    required AppLocalizations localizations,
    required ValueNotifier<String?> optionsErrorNotifier,
  }) {
    final isQuestionValid = validateQuestionText(questionText, localizations);
    final areOptionsValid = validateOptions(
      questionType: questionType,
      optionControllers: optionControllers,
      correctAnswers: correctAnswers,
      localizations: localizations,
      optionsErrorNotifier: optionsErrorNotifier,
    );

    return isQuestionValid && areOptionsValid;
  }

  void clearQuestionTextError() {
    if (questionTextError != null) {
      setState(() {
        questionTextError = null;
      });
    }
  }
}
