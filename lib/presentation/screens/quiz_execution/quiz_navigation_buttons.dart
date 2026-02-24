import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/submit_quiz_dialog.dart';

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
              child: QuizLabAIButton(
                type: QuizlabAIButtonType.secondary,
                title: AppLocalizations.of(context)!.previous,
                icon: Icons.chevron_left,
                expanded: true,
                onPressed: isEvaluating
                    ? null
                    : () {
                        context.read<QuizExecutionBloc>().add(
                          PreviousQuestionRequested(),
                        );
                      },
              ),
            ),
            const SizedBox(width: 16),
          ],

          // Next / Check / Finish Button
          Expanded(
            child: QuizLabAIButton(
              title: isCheckPhase
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
              icon: isCheckPhase
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
              expanded: true,
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
            ),
          ),
        ],
      ),
    );
  }
}
