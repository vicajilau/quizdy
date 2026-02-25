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
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/quiz_question_essay_result.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/quiz_question_explanation.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/quiz_question_image.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/quiz_question_options_result.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';

/// A card widget that displays the result of a quiz question.
///
/// It shows the question text, image (if any), the student's answer,
/// the correct answer, and an explanation. It uses various sub-widgets
/// to handle different parts of the display.
class QuizQuestionResultCard extends StatelessWidget {
  /// The question result data.
  final QuestionResult result;

  /// The number of the question in the quiz.
  final int questionNumber;

  /// The score delta for this question (e.g., +1, -0.5, 0).
  final double scoreDelta;

  /// Whether to show the score delta (e.g., +1, -0.5).
  final bool showScore;

  /// The AI evaluation for this question, if it's an essay question.
  final EssayAiEvaluation? aiEvaluation;

  /// Callback when the retry evaluation button is pressed.
  final VoidCallback? onRetryEvaluation;

  /// Creates a [QuizQuestionResultCard] widget.
  const QuizQuestionResultCard({
    super.key,
    required this.result,
    required this.questionNumber,
    required this.scoreDelta,
    this.showScore = true,
    this.aiEvaluation,
    this.onRetryEvaluation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final successColor = Colors.green;
    final errorColor = Colors.red;
    final neutralColor = theme.disabledColor;

    Color deltaColor;
    String deltaText;

    if (!result.isAnswered) {
      deltaColor = neutralColor;
      deltaText = '0';
    } else if (scoreDelta > 0) {
      deltaColor = successColor;
      deltaText =
          '+${scoreDelta % 1 == 0 ? scoreDelta.toStringAsFixed(0) : (scoreDelta * 10 % 1 == 0 ? scoreDelta.toStringAsFixed(1) : scoreDelta.toStringAsFixed(2))}';
    } else if (scoreDelta < 0) {
      deltaColor = errorColor;
      deltaText = scoreDelta % 1 == 0
          ? scoreDelta.toStringAsFixed(0)
          : (scoreDelta * 10 % 1 == 0
                ? scoreDelta.toStringAsFixed(1)
                : scoreDelta.toStringAsFixed(2));
    } else {
      deltaColor = neutralColor;
      deltaText = '0';
    }

    final statusColor = !result.isAnswered
        ? neutralColor
        : (result.isCorrect ? successColor : errorColor);
    final statusIcon = !result.isAnswered
        ? Icons.remove
        : (result.isCorrect ? Icons.check : Icons.close);

    final bool isPending = aiEvaluation?.isPending == true;
    final bool isError = aiEvaluation?.hasError == true;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
      ),
      color: theme.cardColor,
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: isPending
              ? Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      ),
                    ),
                  ),
                )
              : isError
              ? Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: errorColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.error_outline, color: errorColor, size: 20),
                )
              : Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(statusIcon, color: statusColor, size: 20),
                ),
          title: Text(
            AppLocalizations.of(context)!.questionNumber(questionNumber),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isPending || isError)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isPending
                        ? Colors.orange.withValues(alpha: 0.1)
                        : errorColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isPending
                        ? AppLocalizations.of(context)!.pendingStatus
                        : AppLocalizations.of(context)!.errorStatus,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: isPending ? Colors.orange : errorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else if (showScore)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: deltaColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    deltaText,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: deltaColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (showScore) const SizedBox(width: 12),
              Icon(Icons.expand_more, color: theme.iconTheme.color),
            ],
          ),
          subtitle: LaTeXText(
            result.question.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 1),
                  const SizedBox(height: 16),
                  LaTeXText(
                    result.question.text,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Show image if available
                  if (result.question.image != null)
                    QuizQuestionImage(imageData: result.question.image),

                  // Handle essay questions differently
                  if (result.question.type == QuestionType.essay)
                    QuizQuestionEssayResult(
                      result: result,
                      onRetryEvaluation: onRetryEvaluation,
                    )
                  else
                    QuizQuestionOptionsResult(result: result),

                  // Show explanation if available
                  QuizQuestionExplanation(
                    explanation: result.question.explanation,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
