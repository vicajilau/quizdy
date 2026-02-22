import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_scoring_helper.dart';

/// BLoC for managing quiz execution state and logic.
class QuizExecutionBloc extends Bloc<QuizExecutionEvent, QuizExecutionState> {
  QuizExecutionBloc() : super(QuizExecutionInitial()) {
    // Handle quiz start
    on<QuizExecutionStarted>((event, emit) {
      emit(
        QuizExecutionInProgress(
          questions: event.questions,
          currentQuestionIndex: 0,
          userAnswers: {},
          quizConfig: event.quizConfig,
        ),
      );
    });

    // Handle answer selection
    on<AnswerSelected>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final currentQuestionIndex = currentState.currentQuestionIndex;
        final currentQuestion = currentState.currentQuestion;
        final newUserAnswers = Map<int, List<int>>.from(
          currentState.userAnswers,
        );

        // Get current answers for this question
        final currentAnswers = List<int>.from(
          newUserAnswers[currentQuestionIndex] ?? [],
        );

        // Handle different question types
        if (currentQuestion.type == QuestionType.multipleChoice) {
          // Multiple choice: allow multiple selections
          if (event.isSelected) {
            // Add answer if not already present
            if (!currentAnswers.contains(event.optionIndex)) {
              currentAnswers.add(event.optionIndex);
            }
          } else {
            // Remove answer if present
            currentAnswers.remove(event.optionIndex);
          }
        } else {
          // Single choice, true/false, essay: allow only one selection
          if (event.isSelected) {
            // Clear all previous answers and set only the selected one
            currentAnswers.clear();
            currentAnswers.add(event.optionIndex);
          } else {
            // Allow deselecting if trying to select the currently selected one
            currentAnswers.remove(event.optionIndex);
          }
        }

        // Update the answers map
        if (currentAnswers.isEmpty) {
          newUserAnswers.remove(currentQuestionIndex);
        } else {
          newUserAnswers[currentQuestionIndex] = currentAnswers;
        }

        // Calculate current incorrect count
        final incorrectCount = QuizScoringHelper.calculateResults(
          currentState.questions,
          newUserAnswers,
          currentState.essayAnswers,
        ).incorrectAnswers;

        final newState = currentState.copyWith(
          userAnswers: newUserAnswers,
          incorrectAnswersCount: incorrectCount,
        );

        emit(newState);
      }
    });

    // Handle essay answer changes
    on<EssayAnswerChanged>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final currentQuestionIndex = currentState.currentQuestionIndex;
        final newEssayAnswers = Map<int, String>.from(
          currentState.essayAnswers,
        );

        // Update the essay answer for current question
        newEssayAnswers[currentQuestionIndex] = event.text;

        // Calculate current incorrect count
        final incorrectCount = QuizScoringHelper.calculateResults(
          currentState.questions,
          currentState.userAnswers,
          newEssayAnswers,
        ).incorrectAnswers;

        final newState = currentState.copyWith(
          essayAnswers: newEssayAnswers,
          incorrectAnswersCount: incorrectCount,
        );

        emit(newState);
      }
    });

    // Handle Check Answer (Study Mode)
    on<CheckAnswerRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final currentQuestionIndex = currentState.currentQuestionIndex;

        // Add current question to validated set
        final newValidatedQuestions = Set<int>.from(
          currentState.validatedQuestions,
        )..add(currentQuestionIndex);

        emit(currentState.copyWith(validatedQuestions: newValidatedQuestions));
      }
    });

    // Handle jump to question
    on<JumpToQuestionRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        if (event.index >= 0 && event.index < currentState.questions.length) {
          emit(currentState.copyWith(currentQuestionIndex: event.index));
        }
      }
    });

    // Handle essay AI evaluation started
    on<EssayAiEvaluationStarted>((event, emit) {
      if (state is QuizExecutionInProgress) {
        emit((state as QuizExecutionInProgress).copyWith(isAiEvaluating: true));
      }
    });

    // Handle essay AI evaluation received
    on<EssayAiEvaluationReceived>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final newAiEvaluations = Map<int, EssayAiEvaluation>.from(
          currentState.aiEvaluations,
        );

        newAiEvaluations[event.questionIndex] = EssayAiEvaluation(
          evaluation: event.evaluation,
          errorMessage: event.errorMessage,
        );

        emit(
          currentState.copyWith(
            aiEvaluations: newAiEvaluations,
            isAiEvaluating: false,
          ),
        );
      }
    });

    // Handle next question
    on<NextQuestionRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;

        // Check for max incorrect answers limit (Deferred Check)
        if (!currentState.isStudyMode &&
            currentState.quizConfig.enableMaxIncorrectAnswers &&
            currentState.quizConfig.maxIncorrectAnswers != null &&
            currentState.incorrectAnswersCount >=
                currentState.quizConfig.maxIncorrectAnswers!) {
          _emitQuizCompleted(emit, currentState, wasLimitReached: true);
          return;
        }

        if (!currentState.isLastQuestion) {
          emit(
            currentState.copyWith(
              currentQuestionIndex: currentState.currentQuestionIndex + 1,
            ),
          );
        }
      }
    });

    // Handle previous question
    on<PreviousQuestionRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        if (!currentState.isFirstQuestion) {
          emit(
            currentState.copyWith(
              currentQuestionIndex: currentState.currentQuestionIndex - 1,
            ),
          );
        }
      }
    });

    // Handle quiz submission
    on<QuizSubmitted>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;

        // Check for max incorrect answers limit (Deferred Check)
        if (!currentState.isStudyMode &&
            currentState.quizConfig.enableMaxIncorrectAnswers &&
            currentState.quizConfig.maxIncorrectAnswers != null &&
            currentState.incorrectAnswersCount >=
                currentState.quizConfig.maxIncorrectAnswers!) {
          _emitQuizCompleted(emit, currentState, wasLimitReached: true);
        } else {
          _emitQuizCompleted(emit, currentState);
        }
      }
    });

    // Handle quiz restart
    on<QuizRestarted>((event, emit) {
      if (state is QuizExecutionCompleted) {
        final completedState = state as QuizExecutionCompleted;
        emit(
          QuizExecutionInProgress(
            questions: completedState.questions,
            currentQuestionIndex: 0,
            userAnswers: {},
            essayAnswers: {},
            validatedQuestions: {},
            aiEvaluations: {},
            quizConfig: completedState.quizConfig,
          ),
        );
      }
    });
  }

  /// Helper to emit completion state
  void _emitQuizCompleted(
    Emitter<QuizExecutionState> emit,
    QuizExecutionInProgress currentState, {
    bool wasLimitReached = false,
  }) {
    final results = QuizScoringHelper.calculateResults(
      currentState.questions,
      currentState.userAnswers,
      currentState.essayAnswers,
    );

    // Re-evaluate wasLimitReached for the final result:
    // Unanswered questions also count as failures for pass/fail.
    bool finalLimitReached = wasLimitReached;
    if (!finalLimitReached &&
        currentState.quizConfig.enableMaxIncorrectAnswers &&
        currentState.quizConfig.maxIncorrectAnswers != null) {
      final totalFailures =
          results.incorrectAnswers + results.unansweredAnswers;
      if (totalFailures >= currentState.quizConfig.maxIncorrectAnswers!) {
        finalLimitReached = true;
      }
    }

    final scorePercentage = QuizScoringHelper.calculateScore(
      results.correctAnswers,
      results.incorrectAnswers,
      currentState.totalQuestions,
      currentState.quizConfig,
    );

    emit(
      QuizExecutionCompleted(
        questions: currentState.questions,
        userAnswers: currentState.userAnswers,
        essayAnswers: currentState.essayAnswers,
        correctAnswers: results.correctAnswers,
        totalQuestions: currentState.totalQuestions,
        quizConfig: currentState.quizConfig,
        score: scorePercentage,
        wasLimitReached: finalLimitReached,
        aiEvaluations: currentState.aiEvaluations,
      ),
    );
  }
}
