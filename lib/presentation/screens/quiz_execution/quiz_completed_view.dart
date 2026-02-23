import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/double_extensions.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/quiz_question_result_card.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/quiz_completed_buttons.dart';

class QuizCompletedView extends StatefulWidget {
  const QuizCompletedView({super.key, required this.state});

  final QuizExecutionCompleted state;

  @override
  State<QuizCompletedView> createState() => _QuizCompletedViewState();
}

class _QuizCompletedViewState extends State<QuizCompletedView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _triggerEvaluations();
      }
    });
  }

  void _triggerEvaluations() {
    if (widget.state.hasPendingAiEvaluations) {
      final bloc = context.read<QuizExecutionBloc>();
      final pendingIndices = widget.state.aiEvaluations.entries
          .where((e) => e.value.isPending)
          .map((e) => e.key)
          .toList();

      final localizations = AppLocalizations.of(context)!;
      for (final index in pendingIndices) {
        bloc.add(EssayAiEvaluationRequested(index, localizations));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final secondaryTextColor = theme.hintColor;
    final successColor = Colors.green;
    final alertColor = Colors.orange;

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.state.wasLimitReached
                          ? AppLocalizations.of(context)!.quizFailedLimitReached
                          : (widget.state.hasPendingAiEvaluations
                                ? AppLocalizations.of(
                                    context,
                                  )!.evaluatingResponses
                                : AppLocalizations.of(context)!.quizCompleted),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.state.hasPendingAiEvaluations) ...[
                      const SizedBox(height: 4),
                      Text(
                        AppLocalizations.of(context)!.pendingEvaluationsCount(
                          widget.state.pendingAiEvaluationsCount,
                        ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),

        // Scrollable content area
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // Score Card
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Column(
                    children: [
                      // Status Display (Pass/Fail vs Score)
                      // Status Display (Pass/Fail vs Score)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (widget.state.hasPendingAiEvaluations)
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CircularProgressIndicator(
                                strokeWidth: 12,
                                backgroundColor: const Color(0xFF3F3F46),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.primaryColor,
                                ),
                                strokeCap: StrokeCap.round,
                              ),
                            )
                          else if (!widget
                              .state
                              .quizConfig
                              .enableMaxIncorrectAnswers)
                            SizedBox(
                              width: 140,
                              height: 140,
                              child: CircularProgressIndicator(
                                value: widget.state.score / 100,
                                strokeWidth: 12,
                                backgroundColor: theme.dividerColor.withValues(
                                  alpha: 0.1,
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  (widget.state.score >= 70 &&
                                          !widget.state.wasLimitReached)
                                      ? successColor
                                      : alertColor,
                                ),
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                          if (!widget.state.hasPendingAiEvaluations &&
                              widget.state.quizConfig.enableMaxIncorrectAnswers)
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: widget.state.wasLimitReached
                                      ? alertColor
                                      : successColor,
                                  width: 4,
                                ),
                                color:
                                    (widget.state.wasLimitReached
                                            ? alertColor
                                            : successColor)
                                        .withValues(alpha: 0.1),
                              ),
                              child: Icon(
                                widget.state.wasLimitReached
                                    ? Icons.cancel
                                    : Icons.check_circle,
                                color: widget.state.wasLimitReached
                                    ? alertColor
                                    : successColor,
                                size: 64,
                              ),
                            ),
                          if (!widget.state.hasPendingAiEvaluations &&
                              !widget
                                  .state
                                  .quizConfig
                                  .enableMaxIncorrectAnswers)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${widget.state.score % 1 == 0 ? widget.state.score.toStringAsFixed(0) : widget.state.score.toStringAsFixed(1)}%',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            (widget.state.score >= 70 &&
                                                !widget.state.wasLimitReached)
                                            ? successColor
                                            : alertColor,
                                      ),
                                ),
                                Text(
                                  '${widget.state.correctAnswers.toCleanString()}/${widget.state.totalQuestions}',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (widget.state.hasPendingAiEvaluations) ...[
                        Text(
                          AppLocalizations.of(context)!.evaluatingResponses,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.pendingEvaluationsCount(
                            widget.state.pendingAiEvaluationsCount,
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: secondaryTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ] else ...[
                        if (widget.state.quizConfig.enableMaxIncorrectAnswers)
                          Text(
                            widget.state.wasLimitReached
                                ? AppLocalizations.of(context)!.examFailedStatus
                                : AppLocalizations.of(
                                    context,
                                  )!.examPassedStatus,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                              color: widget.state.wasLimitReached
                                  ? alertColor
                                  : successColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (widget.state.quizConfig.enableMaxIncorrectAnswers)
                          const SizedBox(height: 12),
                        Text(
                          widget.state.quizConfig.enableMaxIncorrectAnswers
                              ? (widget.state.wasLimitReached
                                    ? AppLocalizations.of(
                                        context,
                                      )!.keepPracticing
                                    : AppLocalizations.of(
                                        context,
                                      )!.congratulations)
                              : ((widget.state.score >= 70 &&
                                        !widget.state.wasLimitReached)
                                    ? AppLocalizations.of(
                                        context,
                                      )!.congratulations
                                    : AppLocalizations.of(
                                        context,
                                      )!.keepPracticing),
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      if (!widget.state.hasPendingAiEvaluations) ...[
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.correctAnswers(
                            widget.state.correctAnswers.toCleanString(),
                            widget.state.totalQuestions,
                          ),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Question results
                ...widget.state.questionResults.asMap().entries.map((entry) {
                  final index = entry.key;
                  final result = entry.value;

                  double scoreDelta = 0.0;
                  if (result.question.type == QuestionType.essay) {
                    final eval = widget.state.aiEvaluations[index];
                    if (eval != null &&
                        eval.isCompleted &&
                        eval.score != null) {
                      scoreDelta = eval.score! / 100.0; // Partial points
                      if (eval.score! < 50 &&
                          widget.state.quizConfig.subtractPoints) {
                        scoreDelta -= widget.state.quizConfig.penaltyAmount;
                      }
                    } else if (eval?.isPending == true ||
                        eval?.isNotEvaluated == true ||
                        eval == null) {
                      scoreDelta =
                          1.0; // Standard optimistic points until evaluated
                    }
                  } else if (result.isCorrect) {
                    scoreDelta = 1.0;
                  } else if (result.isAnswered) {
                    // Answered but incorrect
                    if (widget.state.quizConfig.subtractPoints) {
                      scoreDelta = -widget.state.quizConfig.penaltyAmount;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: QuizQuestionResultCard(
                      result: result,
                      questionNumber: index + 1,
                      scoreDelta: scoreDelta,
                      showScore:
                          !widget.state.quizConfig.enableMaxIncorrectAnswers,
                      aiEvaluation: widget.state.aiEvaluations[index],
                      onRetryEvaluation: () {
                        context.read<QuizExecutionBloc>().add(
                          EssayAiEvaluationRetryRequested(
                            index,
                            AppLocalizations.of(context)!,
                          ),
                        );
                      },
                    ),
                  );
                }),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),

        // Action buttons at bottom
        Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            border: Border(
              top: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;
              final hasIncorrect = _hasIncorrectAnswers();

              // Define buttons
              final tryAgainBtn = const QuizTryAgainButton();
              final retryBtn = QuizRetryFailedButton(
                isDarkMode: isDarkMode,
                onPressed: () => _startFailedQuestionsQuiz(context),
              );
              final homeBtn = QuizHomeButton(isDarkMode: isDarkMode);

              // Mobile AND has incorrect answers (3 buttons total) -> Vertical stack
              if (isMobile && hasIncorrect) {
                return Column(
                  spacing: 12,
                  children: [
                    if (widget.state.isStudyMode)
                      SizedBox(width: double.infinity, child: tryAgainBtn),
                    SizedBox(width: double.infinity, child: retryBtn),
                    SizedBox(width: double.infinity, child: homeBtn),
                  ],
                );
              }

              // Desktop OR no incorrect answers (2 buttons) -> 1 Row
              return Row(
                spacing: 12,
                children: [
                  if (hasIncorrect && widget.state.isStudyMode)
                    Expanded(child: tryAgainBtn),
                  if (hasIncorrect) Expanded(child: retryBtn),
                  Expanded(child: homeBtn),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  /// Check if there are any incorrect answers
  bool _hasIncorrectAnswers() {
    return widget.state.questionResults.any((result) => !result.isCorrect);
  }

  /// Start a new quiz with only the failed questions
  void _startFailedQuestionsQuiz(BuildContext context) {
    // Get only the questions that were answered incorrectly
    final failedQuestions = widget.state.questionResults
        .where((result) => !result.isCorrect)
        .map((result) => result.question)
        .toList();

    if (failedQuestions.isNotEmpty) {
      // Start a new quiz with only the failed questions
      final bloc = BlocProvider.of<QuizExecutionBloc>(context);
      bloc.add(
        QuizExecutionStarted(
          failedQuestions,
          quizConfig: widget.state.quizConfig,
        ),
      );
    }
  }
}
