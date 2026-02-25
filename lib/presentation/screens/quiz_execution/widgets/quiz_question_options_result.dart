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
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/utils/question_translation_helper.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';

/// A widget that displays the options for multiple choice or true/false questions.
///
/// It highlights correct and incorrect answers based on the user's selection
/// and the provided results.
class QuizQuestionOptionsResult extends StatelessWidget {
  /// The question result data.
  final QuestionResult result;

  /// Creates a [QuizQuestionOptionsResult] widget.
  const QuizQuestionOptionsResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    if (result.question.type == QuestionType.essay) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ...result.question.options.asMap().entries.map((entry) {
          final optionIndex = entry.key;
          final optionText = entry.value;
          final isCorrect = result.correctAnswers.contains(optionIndex);
          final wasSelected = result.userAnswers.contains(optionIndex);

          Color? backgroundColor;
          Color? borderColor;
          IconData? icon;
          Color? iconColor;
          Color? textColor;
          FontWeight fontWeight = FontWeight.normal;

          if (isCorrect && wasSelected) {
            // Correct answer selected - Bright green
            backgroundColor = Colors.green.withValues(alpha: 0.15);
            borderColor = Colors.green;
            icon = Icons.check_circle;
            iconColor = Colors.green;
            textColor = Colors.green.shade800;
            fontWeight = FontWeight.w600;
          } else if (isCorrect && !wasSelected) {
            // Correct answer NOT selected - Orange/Yellow (missed)
            backgroundColor = Colors.orange.withValues(alpha: 0.1);
            borderColor = Colors.orange;
            icon = Icons.radio_button_unchecked;
            iconColor = Colors.orange;
            textColor = Colors.orange.shade800;
            fontWeight = FontWeight.w500;
          } else if (!isCorrect && wasSelected) {
            // Incorrect answer selected - Red
            backgroundColor = Colors.red.withValues(alpha: 0.1);
            borderColor = Colors.red;
            icon = Icons.cancel;
            iconColor = Colors.red;
            textColor = Colors.red.shade800;
            fontWeight = FontWeight.w500;
          } else {
            // Answer not selected and incorrect - Neutral gray
            backgroundColor = null;
            borderColor = null;
            icon = null;
            iconColor = null;
            textColor = Theme.of(context).colorScheme.onSurface;
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
              border: borderColor != null
                  ? Border.all(color: borderColor, width: 1.5)
                  : Border.all(
                      color: Theme.of(
                        context,
                      ).dividerColor.withValues(alpha: 0.3),
                    ),
            ),
            child: Row(
              children: [
                if (icon != null) Icon(icon, size: 22, color: iconColor),
                if (icon != null) const SizedBox(width: 12),
                Expanded(
                  child: LaTeXText(
                    QuestionTranslationHelper.translateOption(
                      optionText,
                      AppLocalizations.of(context)!,
                    ),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: fontWeight,
                      fontSize: 15,
                    ),
                  ),
                ),
                // Add explanatory text for clarity
                if (isCorrect && wasSelected)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.correctSelectedLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (isCorrect && !wasSelected)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.correctMissedLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (!isCorrect && wasSelected)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.incorrectSelectedLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
