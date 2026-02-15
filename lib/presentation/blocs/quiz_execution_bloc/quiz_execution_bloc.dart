import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';

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
        final incorrectCount = _calculateResultsCount(
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
        final incorrectCount = _calculateResultsCount(
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
            quizConfig: completedState.quizConfig,
          ),
        );
      }
    });
  }

  /// Helper method to check if answer is correct
  bool _isAnswerCorrect(
    Question question,
    List<int> userAnswers,
    String essayAnswer,
  ) {
    // Essay questions are always considered "correct" since they require manual grading
    if (question.type == QuestionType.essay) {
      return essayAnswer.trim().isNotEmpty;
    }

    final correctAnswers = question.correctAnswers;
    if (correctAnswers.length != userAnswers.length) return false;
    final sortedCorrect = List<int>.from(correctAnswers)..sort();
    final sortedUser = List<int>.from(userAnswers)..sort();
    return sortedCorrect.toString() == sortedUser.toString();
  }

  /// Calculates correct and incorrect counts
  _QuizResults _calculateResultsCount(
    List<Question> questions,
    Map<int, List<int>> userAnswers,
    Map<int, String> essayAnswers,
  ) {
    int correctCount = 0;
    int incorrectCount = 0;

    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final userAnswer = userAnswers[i] ?? [];
      final essayAnswer = essayAnswers[i] ?? '';

      // Determine if answered
      bool isAnswered = false;
      if (question.type == QuestionType.essay) {
        isAnswered = essayAnswer.trim().isNotEmpty;
      } else {
        isAnswered = userAnswer.isNotEmpty;
      }

      if (isAnswered) {
        if (_isAnswerCorrect(question, userAnswer, essayAnswer)) {
          correctCount++;
        } else {
          incorrectCount++;
        }
      }
    }

    return _QuizResults(correctCount, incorrectCount);
  }

  /// Helper to emit completion state
  void _emitQuizCompleted(
    Emitter<QuizExecutionState> emit,
    QuizExecutionInProgress currentState, {
    bool wasLimitReached = false,
  }) {
    final results = _calculateResultsCount(
      currentState.questions,
      currentState.userAnswers,
      currentState.essayAnswers,
    );

    // Calculate score
    double penalty =
        (currentState.quizConfig.subtractPoints &&
            !currentState.quizConfig.isStudyMode)
        ? currentState.quizConfig.penaltyAmount
        : 0.0;

    double netScore =
        results.correctAnswers - (results.incorrectAnswers * penalty);
    double totalQuestions = currentState.totalQuestions.toDouble();
    double scorePercentage = totalQuestions > 0
        ? (netScore / totalQuestions) * 100
        : 0.0;

    emit(
      QuizExecutionCompleted(
        questions: currentState.questions,
        userAnswers: currentState.userAnswers,
        essayAnswers: currentState.essayAnswers,
        correctAnswers: results.correctAnswers,
        totalQuestions: currentState.totalQuestions,
        quizConfig: currentState.quizConfig,
        score: scorePercentage,
        wasLimitReached: wasLimitReached,
      ),
    );
  }
}

class _QuizResults {
  final int correctAnswers;
  final int incorrectAnswers;

  _QuizResults(this.correctAnswers, this.incorrectAnswers);
}
