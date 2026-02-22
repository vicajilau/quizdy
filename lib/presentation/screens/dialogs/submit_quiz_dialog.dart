import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/questions_overview_bottom_sheet.dart';

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
                              return SizedBox(
                                height: 56,
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    context.pop();
                                    QuestionsOverviewBottomSheet.show(
                                      context,
                                      state as QuizExecutionInProgress,
                                      bloc,
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: colors.card,
                                    side: BorderSide(
                                      color: colors.border,
                                      width: 2,
                                    ),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  icon: Icon(
                                    Icons.near_me_outlined,
                                    size: 20,
                                    color: colors.subtitle,
                                  ),
                                  label: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.resolveUnansweredQuestions,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: colors.subtitle,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      }

                      Widget buildFinishButton() {
                        return SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.pop();
                              bloc.add(
                                QuizSubmitted(isAiAvailable: isAiAvailable),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            icon: const Icon(
                              Icons.check_circle_outline,
                              size: 20,
                            ),
                            label: Text(
                              AppLocalizations.of(context)!.finish,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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
