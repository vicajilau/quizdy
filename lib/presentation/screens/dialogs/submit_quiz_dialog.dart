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
import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/questions_overview_bottom_sheet.dart';

class SubmitQuizDialog {
  static void show(
    BuildContext context,
    QuizExecutionBloc bloc, {
    bool isAiAvailable = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final colors = context.appColors;

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: colors.card,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header (Title + Close Button)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.finishQuiz,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: colors.title,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          backgroundColor: colors.surface,
                          fixedSize: const Size(40, 40),
                          padding: EdgeInsets.zero,
                        ),
                        icon: Icon(
                          Icons.close,
                          size: 20,
                          color: colors.subtitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Content
                  Builder(
                    builder: (context) {
                      final state = bloc.state;
                      int unansweredCount = 0;
                      if (state is QuizExecutionInProgress) {
                        unansweredCount =
                            state.totalQuestions - state.answeredQuestionsCount;
                      }

                      final message = unansweredCount > 0
                          ? AppLocalizations.of(
                              context,
                            )!.finishQuizUnansweredQuestions(unansweredCount)
                          : AppLocalizations.of(
                              context,
                            )!.finishQuizConfirmation;

                      return Text(
                        message,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: colors.subtitle,
                          height: 1.5,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Actions (Responsive: Row on wide, Column on narrow)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Refactoring buttons into variables for cleaner usage in Row/Column
                      Widget buildResolveButton() {
                        return Builder(
                          builder: (context) {
                            final state = bloc.state;
                            int? firstUnansweredIndex;
                            if (state is QuizExecutionInProgress) {
                              for (int i = 0; i < state.questions.length; i++) {
                                final isAnswered =
                                    state.userAnswers.containsKey(i) &&
                                    state.userAnswers[i]!.isNotEmpty;
                                final isEssayAnswered =
                                    state.essayAnswers.containsKey(i) &&
                                    state.essayAnswers[i]!.trim().isNotEmpty;

                                if (!isAnswered && !isEssayAnswered) {
                                  firstUnansweredIndex = i;
                                  break;
                                }
                              }
                            }

                            if (firstUnansweredIndex != null) {
                              return QuizLabAIButton(
                                type: QuizlabAIButtonType.secondary,
                                title: AppLocalizations.of(
                                  context,
                                )!.resolveUnansweredQuestions,
                                icon: Icons.near_me_outlined,
                                expanded: true,
                                onPressed: () {
                                  context.pop();
                                  QuestionsOverviewBottomSheet.show(
                                    context,
                                    state as QuizExecutionInProgress,
                                    bloc,
                                  );
                                },
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      }

                      Widget buildFinishButton() {
                        return QuizLabAIButton(
                          title: AppLocalizations.of(context)!.finish,
                          icon: Icons.check_circle_outline,
                          expanded: true,
                          onPressed: () {
                            context.pop();
                            bloc.add(
                              QuizSubmitted(isAiAvailable: isAiAvailable),
                            );
                          },
                        );
                      }

                      bool showResolveButton = false;
                      final state = bloc.state;
                      if (state is QuizExecutionInProgress) {
                        int unansweredCount =
                            state.totalQuestions - state.answeredQuestionsCount;
                        if (unansweredCount > 0) showResolveButton = true;
                      }

                      if (!showResolveButton) {
                        return buildFinishButton();
                      }

                      if (constraints.maxWidth > 450) {
                        return Row(
                          children: [
                            Expanded(child: buildResolveButton()),
                            const SizedBox(width: 16),
                            Expanded(child: buildFinishButton()),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            buildResolveButton(),
                            const SizedBox(height: 12),
                            buildFinishButton(),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
