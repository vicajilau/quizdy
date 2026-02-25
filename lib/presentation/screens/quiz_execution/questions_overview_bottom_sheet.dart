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
import 'package:quizlab_ai/core/extensions/question_validation_extension.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';

class QuestionsOverviewBottomSheet extends StatelessWidget {
  final QuizExecutionInProgress state;

  const QuestionsOverviewBottomSheet({super.key, required this.state});

  static void show(
    BuildContext context,
    QuizExecutionInProgress state,
    QuizExecutionBloc bloc,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => BlocProvider.value(
        value: bloc,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            child: QuestionsOverviewBottomSheet(state: state),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).primaryColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min, // Wrap content height
      children: [
        // Handle bar
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.zinc700 : AppTheme.zinc300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations.questionsOverview,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${state.answeredQuestionsCount} / ${state.totalQuestions}',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),

        const Divider(),

        // Grid
        Flexible(
          child: GridView.builder(
            shrinkWrap: true, // Allow GridView to wrap its content
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 60,
              childAspectRatio: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: state.totalQuestions,
            itemBuilder: (context, index) {
              final isCurrent = index == state.currentQuestionIndex;
              final isAnswered =
                  state.userAnswers.containsKey(index) &&
                  state.userAnswers[index]!.isNotEmpty;
              final isEssayAnswered =
                  state.essayAnswers.containsKey(index) &&
                  state.essayAnswers[index]!.trim().isNotEmpty;
              final hasAnswer = isAnswered || isEssayAnswered;

              final question = state.questions[index];
              bool isCorrect = false;

              if (hasAnswer) {
                if (question.type == QuestionType.essay) {
                  // For essay, if answered, we consider it "green" for now as per plan
                  isCorrect = true;
                } else {
                  final userAns = state.userAnswers[index] ?? [];
                  isCorrect = question.isAnswerCorrect(userAns);
                }
              }

              Color bgColor;
              Color textColor;
              Border? border;

              if (hasAnswer) {
                if (!state.isStudyMode) {
                  // Exam Mode: Neutral "answered" color
                  bgColor = primaryColor.withValues(alpha: 0.1);
                  textColor = primaryColor;
                  border = Border.all(
                    color: primaryColor.withValues(alpha: 0.3),
                  );
                } else if (isCorrect) {
                  bgColor = isDark
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.green.withValues(alpha: 0.1);
                  textColor = isDark ? Colors.green[200]! : Colors.green[800]!;
                  border = Border.all(
                    color: isDark ? Colors.green[700]! : Colors.green[300]!,
                  );
                } else {
                  bgColor = isDark
                      ? AppTheme.errorColor.withValues(alpha: 0.2)
                      : AppTheme.errorColor.withValues(alpha: 0.1);
                  textColor = isDark
                      ? const Color(0xFFFCA5A5)
                      : const Color(0xFF991B1B);
                  border = Border.all(
                    color: isDark
                        ? const Color(0xFFB91C1C)
                        : const Color(0xFFFCA5A5),
                  );
                }
              } else {
                bgColor = Colors.transparent;
                textColor = isDark ? AppTheme.zinc500 : AppTheme.zinc400;
                border = Border.all(
                  color: isDark ? AppTheme.zinc800 : AppTheme.borderColor,
                );
              }

              if (isCurrent) {
                // Overlay purple styling for current question
                // If it has answer, we keep the background indicating correctness/incorrectness
                // but add a strong purple border to indicate "current".
                // If no answer, we use purple background as before?
                // Request says: "Si no se ha contestado no tiene color y se pone lila sobre la actual indicando que estás encima de esa"
                // This implies:
                // - Unanswered & Current -> Purple overlay (or background)
                // - Answered & Current -> Green/Red background + Purple indication (border?)

                // Let's prioritize the "Current" indication.
                if (!hasAnswer) {
                  bgColor = primaryColor.withValues(alpha: 0.2);
                  textColor = primaryColor;
                }
                border = Border.all(color: primaryColor, width: 2);
              }

              return InkWell(
                onTap: () {
                  // Navigate to question
                  // We need an event for jumping to index, logic might need check
                  // Assuming we can just emit state with new index or similar.
                  // Looking at Bloc events... we might need to add a JumpToQuestion event if not exists.
                  // Or use Next/Prev multiple times (bad).
                  // Let's assume we adding JumpToQuestionRequested event.
                  // NOTE: I'll need to check if JumpToQuestionRequested exists or add it.

                  // For now, let's close sheet and try to find a way to jump.
                  // If JumpToQuestionRequested doesn't exist, I will add it.
                  context.read<QuizExecutionBloc>().add(
                    JumpToQuestionRequested(index),
                  );
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                    border: border,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
