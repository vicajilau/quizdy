import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/screens/dialogs/submit_quiz_dialog.dart';

class QuizNavigationButtons extends StatelessWidget {
  final QuizExecutionInProgress state;
  final bool isStudyMode;
  final bool isAiAvailable;

  const QuizNavigationButtons({
    super.key,
    required this.state,
    this.isStudyMode = false,
    this.isAiAvailable = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    final isCheckPhase = isStudyMode && !state.isCurrentQuestionValidated;
    final isEvaluating = state.isAiEvaluating;
    final canProceed = isCheckPhase
        ? (state.hasCurrentQuestionAnswered && !isEvaluating)
        : !isEvaluating;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous Button
          if (!state.isFirstQuestion) ...[
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: isEvaluating
                      ? null
                      : () {
                          context.read<QuizExecutionBloc>().add(
                            PreviousQuestionRequested(),
                          );
                        },
                  icon: Icon(Icons.chevron_left, color: colors.subtitle),
                  label: Text(
                    AppLocalizations.of(context)!.previous,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colors.subtitle,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: colors.card,
                    side: BorderSide(color: colors.border, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],

          // Next / Check / Finish Button
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: canProceed
                    ? () {
                        if (isCheckPhase) {
                          context.read<QuizExecutionBloc>().add(
                            CheckAnswerRequested(),
                          );
                        } else if (state.isLastQuestion) {
                          SubmitQuizDialog.show(
                            context,
                            context.read<QuizExecutionBloc>(),
                            isAiAvailable: isAiAvailable,
                          );
                        } else {
                          context.read<QuizExecutionBloc>().add(
                            NextQuestionRequested(),
                          );
                        }
                      }
                    : (isCheckPhase && !state.hasCurrentQuestionAnswered
                          ? () {
                              if (state.isLastQuestion) {
                                SubmitQuizDialog.show(
                                  context,
                                  context.read<QuizExecutionBloc>(),
                                  isAiAvailable: isAiAvailable,
                                );
                              } else {
                                context.read<QuizExecutionBloc>().add(
                                  NextQuestionRequested(),
                                );
                              }
                            }
                          : null),
                icon: Icon(
                  isCheckPhase
                      ? (state.hasCurrentQuestionAnswered
                            ? Icons.check_circle
                            : (state.isLastQuestion
                                  ? Icons.check
                                  : Icons.skip_next))
                      : (state.isLastQuestion
                            ? Icons.check
                            : (state.hasCurrentQuestionAnswered
                                  ? Icons.chevron_right
                                  : Icons.skip_next)),
                  color: Colors.white,
                ),
                label: Text(
                  isCheckPhase
                      ? (state.hasCurrentQuestionAnswered
                            ? AppLocalizations.of(context)!.checkAnswer
                            : (state.isLastQuestion
                                  ? AppLocalizations.of(context)!.finish
                                  : AppLocalizations.of(context)!.skip))
                      : (state.isLastQuestion
                            ? AppLocalizations.of(context)!.finish
                            : (state.hasCurrentQuestionAnswered
                                  ? AppLocalizations.of(context)!.next
                                  : AppLocalizations.of(context)!.skip)),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
