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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/utils/question_translation_helper.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';

/// A widget representing a single option in a quiz question.
///
/// It handles the display of the option text (supporting LaTeX), as well as
/// visual feedback for selection state and correctness (in Study Mode).
///
/// This widget adapts its appearance based on [questionType] (Checkbox for
/// multiple choice, Radio for others).
class QuestionOptionTile extends StatelessWidget {
  /// The type of the question (e.g., multiple choice, single choice).
  final QuestionType questionType;

  /// The text content of the option.
  final String option;

  /// The index of this option in the question's option list.
  final int index;

  /// Whether this option is currently selected by the user.
  final bool isSelected;

  /// Whether the quiz is currently in Study Mode (which shows immediate feedback).
  final bool isStudyMode;

  /// The current execution state of the quiz.
  final QuizExecutionInProgress state;

  /// Creates a [QuestionOptionTile].
  const QuestionOptionTile({
    super.key,
    required this.questionType,
    required this.option,
    required this.index,
    required this.isSelected,
    required this.isStudyMode,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final translatedOption = QuestionTranslationHelper.translateOption(
      option,
      localizations,
    );

    final optionTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
    );

    // Determine colors and border based on state
    Color borderColor = Theme.of(context).dividerColor.withValues(alpha: 0.5);
    Color backgroundColor = Theme.of(context).cardColor;
    Color? iconColor;

    // Logic for Study Mode validation styling
    if (isStudyMode && state.isCurrentQuestionValidated) {
      final isCorrect = state.currentQuestion.correctAnswers.contains(index);

      // Background Color
      if (isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: 0.1);
      } else if (isSelected) {
        backgroundColor = Colors.red.withValues(alpha: 0.1);
      }

      // Border Color
      if (isSelected) {
        borderColor = Theme.of(
          context,
        ).primaryColor; // User selection always Purple
      } else if (isCorrect) {
        borderColor = Colors.green; // Missed correct answer
      }

      // Icon Color (used for checkbox border in some cases)
      if (isSelected) {
        iconColor = Theme.of(context).primaryColor;
      } else if (isCorrect) {
        iconColor = Colors.green;
      }
    }
    // Logic for normal selection styling
    else if (isSelected) {
      borderColor = Theme.of(context).primaryColor;
      backgroundColor = Theme.of(context).primaryColor.withValues(alpha: 0.05);
      iconColor = Theme.of(context).primaryColor;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Disable interaction if validated in study mode
          if (isStudyMode && state.isCurrentQuestionValidated) return;

          // Toggle for multiple choice
          if (questionType == QuestionType.multipleChoice) {
            context.read<QuizExecutionBloc>().add(
              AnswerSelected(index, !isSelected),
            );
          }
          // Select for single choice/others
          else {
            context.read<QuizExecutionBloc>().add(
              AnswerSelected(index, !isSelected),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width:
                  isSelected ||
                      (isStudyMode &&
                          state.isCurrentQuestionValidated &&
                          state.currentQuestion.correctAnswers.contains(index))
                  ? 2
                  : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Indicator (Radio or Checkbox look-alike)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: questionType == QuestionType.multipleChoice
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  borderRadius: questionType == QuestionType.multipleChoice
                      ? BorderRadius.circular(6)
                      : null,
                  border: Border.all(
                    color: isStudyMode && state.isCurrentQuestionValidated
                        ? (isSelected
                              ? Theme.of(context).primaryColor
                              : (state.currentQuestion.correctAnswers.contains(
                                      index,
                                    )
                                    ? Colors.green
                                    : Colors.grey.shade400))
                        : (isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade400),
                    width: 2,
                  ),
                  color: isStudyMode && state.isCurrentQuestionValidated
                      ? Colors
                            .transparent // Transparent in study mode to show colored icons
                      : (isSelected ? Theme.of(context).primaryColor : null),
                ),
                child: () {
                  if (isStudyMode && state.isCurrentQuestionValidated) {
                    final isCorrect = state.currentQuestion.correctAnswers
                        .contains(index);
                    if (isSelected) {
                      return Icon(
                        isCorrect ? Icons.check : Icons.close,
                        size: 16,
                        color: isCorrect ? Colors.green : Colors.red,
                      );
                    } else if (isCorrect) {
                      return const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.green,
                      );
                    }
                  } else if (isSelected) {
                    return const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    );
                  }
                  return null;
                }(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: LaTeXText(
                  translatedOption,
                  style: optionTextStyle.copyWith(
                    color: isSelected
                        ? (iconColor ?? Theme.of(context).primaryColor)
                        : null,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
