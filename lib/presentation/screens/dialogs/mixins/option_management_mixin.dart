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
import 'package:quizlab_ai/core/constants/question_constants.dart';

mixin OptionManagementMixin<T extends StatefulWidget> on State<T> {
  late List<TextEditingController> optionControllers;
  late List<bool> correctAnswers;
  late List<UniqueKey> optionKeys;
  late ValueNotifier<List<bool>> correctAnswersNotifier;
  late ValueNotifier<String?> optionsErrorNotifier;

  void initializeOptions({
    required List<String> initialOptions,
    required List<int> initialCorrectAnswers,
  }) {
    optionControllers = initialOptions
        .map((option) => TextEditingController(text: option))
        .toList();
    correctAnswers = List.generate(
      initialOptions.length,
      (index) => initialCorrectAnswers.contains(index),
    );
    optionKeys = List.generate(initialOptions.length, (index) => UniqueKey());
    correctAnswersNotifier = ValueNotifier(List.from(correctAnswers));
    optionsErrorNotifier = ValueNotifier(null);
  }

  void initializeDefaultOptions(QuestionType type) {
    switch (type) {
      case QuestionType.multipleChoice:
      case QuestionType.singleChoice:
        optionControllers = List.generate(
          4,
          (index) => TextEditingController(),
        );
        correctAnswers = List.generate(4, (index) => false);
        optionKeys = List.generate(4, (index) => UniqueKey());
        break;
      case QuestionType.trueFalse:
        // This will be handled in didChangeDependencies after context is available
        optionControllers = [];
        correctAnswers = [];
        optionKeys = [];
        break;
      case QuestionType.essay:
        optionControllers = [];
        correctAnswers = [];
        optionKeys = [];
        break;
    }
    correctAnswersNotifier = ValueNotifier(List.from(correctAnswers));
    optionsErrorNotifier = ValueNotifier(null);
  }

  void setupTrueFalseOptions() {
    if (optionControllers.isEmpty) {
      final localizations = AppLocalizations.of(context)!;
      optionControllers = [
        TextEditingController(text: localizations.trueLabel),
        TextEditingController(text: localizations.falseLabel),
      ];
      correctAnswers = [false, false];
      optionKeys = [UniqueKey(), UniqueKey()];
      correctAnswersNotifier.value = List.from(correctAnswers);
    }
  }

  void disposeOptions() {
    for (var controller in optionControllers) {
      controller.dispose();
    }
    correctAnswersNotifier.dispose();
    optionsErrorNotifier.dispose();
  }

  void updateCorrectAnswer(int index, bool? value, QuestionType questionType) {
    if (questionType == QuestionType.multipleChoice) {
      if (correctAnswers[index] != (value ?? false)) {
        correctAnswers[index] = value ?? false;
        correctAnswersNotifier.value = List.from(correctAnswers);
        optionsErrorNotifier.value = null;
      }
    } else {
      int currentCorrectIndex = correctAnswers.indexWhere((element) => element);
      if (currentCorrectIndex != index) {
        for (int i = 0; i < correctAnswers.length; i++) {
          correctAnswers[i] = (i == index);
        }
        correctAnswersNotifier.value = List.from(correctAnswers);
        optionsErrorNotifier.value = null;
      }
    }
  }

  void clearOptionsError() {
    if (optionsErrorNotifier.value != null) {
      optionsErrorNotifier.value = null;
    }
  }

  void addOption() {
    setState(() {
      optionControllers.add(TextEditingController());
      correctAnswers.add(false);
      optionKeys.add(UniqueKey());
      correctAnswersNotifier.value = List.from(correctAnswers);
    });
  }

  void removeOption(int index) {
    if (optionControllers.length > 2) {
      setState(() {
        optionControllers[index].dispose();
        optionControllers.removeAt(index);
        correctAnswers.removeAt(index);
        optionKeys.removeAt(index);
        correctAnswersNotifier.value = List.from(correctAnswers);
      });
    }
  }

  void updateOptionsForType(QuestionType type) {
    // Dispose current controllers
    for (var controller in optionControllers) {
      controller.dispose();
    }

    final localizations = AppLocalizations.of(context)!;
    switch (type) {
      case QuestionType.trueFalse:
        optionControllers = [
          TextEditingController(text: localizations.trueLabel),
          TextEditingController(text: localizations.falseLabel),
        ];
        correctAnswers = [false, false];
        optionKeys = [UniqueKey(), UniqueKey()];
        break;
      case QuestionType.essay:
        optionControllers = [];
        correctAnswers = [];
        optionKeys = [];
        break;
      case QuestionType.multipleChoice:
      case QuestionType.singleChoice:
        optionControllers = List.generate(
          4,
          (index) => TextEditingController(),
        );
        correctAnswers = List.generate(4, (index) => false);
        optionKeys = List.generate(4, (index) => UniqueKey());
        break;
    }

    correctAnswersNotifier.value = List.from(correctAnswers);
  }

  String translateOptionBackToModel(
    String optionText,
    AppLocalizations localizations,
  ) {
    if (optionText == localizations.trueLabel) {
      return QuestionConstants.defaultTrueOption;
    } else if (optionText == localizations.falseLabel) {
      return QuestionConstants.defaultFalseOption;
    }
    return optionText;
  }

  List<String> getValidatedOptions(AppLocalizations localizations) {
    return optionControllers
        .map((controller) => controller.text.trim())
        .where((text) => text.isNotEmpty)
        .map(
          (optionText) => translateOptionBackToModel(optionText, localizations),
        )
        .toList();
  }

  List<int> getCorrectAnswerIndexes() {
    final correctAnswerIndexes = <int>[];
    for (int i = 0; i < correctAnswers.length; i++) {
      if (correctAnswers[i]) {
        correctAnswerIndexes.add(i);
      }
    }
    return correctAnswerIndexes;
  }
}
