import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_scoring_helper.dart';

/// Abstract class representing the base state for quiz execution.
abstract class QuizExecutionState {}

/// Initial state when no quiz execution is in progress.
class QuizExecutionInitial extends QuizExecutionState {}

/// State representing a quiz in progress.
class QuizExecutionInProgress extends QuizExecutionState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final Map<int, List<int>>
  userAnswers; // questionIndex -> selected option indices
  final Map<int, String> essayAnswers; // questionIndex -> essay text
  final int totalQuestions;
  final Set<int>
  validatedQuestions; // Indices of questions that have been checked in Study Mode
  final bool isStudyMode;
  final QuizConfig quizConfig;
  final int incorrectAnswersCount;
  final Map<int, EssayAiEvaluation>
  aiEvaluations; // questionIndex -> evaluation data
  final bool isAiEvaluating;

  QuizExecutionInProgress({
    required this.questions,
    required this.currentQuestionIndex,
    required this.userAnswers,
    required this.quizConfig,
    this.incorrectAnswersCount = 0,
    this.isAiEvaluating = false,
    Map<int, String>? essayAnswers,
    Set<int>? validatedQuestions,
    Map<int, EssayAiEvaluation>? aiEvaluations,
  }) : totalQuestions = questions.length,
       essayAnswers = essayAnswers ?? {},
       validatedQuestions = validatedQuestions ?? {},
       aiEvaluations = aiEvaluations ?? {},
       isStudyMode = quizConfig.isStudyMode;

  /// Get the current question
  Question get currentQuestion => questions[currentQuestionIndex];

  /// Check if this is the first question
  bool get isFirstQuestion => currentQuestionIndex == 0;

  /// Check if this is the last question
  bool get isLastQuestion => currentQuestionIndex == totalQuestions - 1;

  /// Get selected answers for current question
  List<int> get currentQuestionAnswers =>
      userAnswers[currentQuestionIndex] ?? [];

  /// Check if current question has been validated (checked)
  bool get isCurrentQuestionValidated =>
      validatedQuestions.contains(currentQuestionIndex);

  /// Check if an AI evaluation already exists for the current question
  EssayAiEvaluation? get currentAiEvaluation =>
      aiEvaluations[currentQuestionIndex];

  /// Check if an option is selected for current question
  bool isOptionSelected(int optionIndex) {
    return currentQuestionAnswers.contains(optionIndex);
  }

  /// Check if current question has been answered
  bool get hasCurrentQuestionAnswered {
    // For essay questions, check if there's text
    if (currentQuestion.type == QuestionType.essay) {
      final essayText = essayAnswers[currentQuestionIndex];
      return essayText != null && essayText.trim().isNotEmpty;
    }
    // For other questions, check if there are selected options
    return currentQuestionAnswers.isNotEmpty;
  }

  /// Get total answered questions count
  int get answeredQuestionsCount {
    int count = 0;
    for (int i = 0; i < totalQuestions; i++) {
      if (userAnswers.containsKey(i) && userAnswers[i]!.isNotEmpty) {
        count++;
      } else if (essayAnswers.containsKey(i) &&
          essayAnswers[i]!.trim().isNotEmpty) {
        count++;
      }
    }
    return count;
  }

  /// Get progress percentage based on answered questions
  double get progress =>
      totalQuestions > 0 ? answeredQuestionsCount / totalQuestions : 0.0;

  /// Copy with method for state updates
  QuizExecutionInProgress copyWith({
    List<Question>? questions,
    int? currentQuestionIndex,
    Map<int, List<int>>? userAnswers,
    Map<int, String>? essayAnswers,
    Set<int>? validatedQuestions,
    QuizConfig? quizConfig,
    int? incorrectAnswersCount,
    Map<int, EssayAiEvaluation>? aiEvaluations,
    bool? isAiEvaluating,
  }) {
    return QuizExecutionInProgress(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      userAnswers: userAnswers ?? this.userAnswers,
      essayAnswers: essayAnswers ?? this.essayAnswers,
      validatedQuestions: validatedQuestions ?? this.validatedQuestions,
      quizConfig: quizConfig ?? this.quizConfig,
      incorrectAnswersCount:
          incorrectAnswersCount ?? this.incorrectAnswersCount,
      aiEvaluations: aiEvaluations ?? this.aiEvaluations,
      isAiEvaluating: isAiEvaluating ?? this.isAiEvaluating,
    );
  }
}

/// State representing quiz completion with results.
class QuizExecutionCompleted extends QuizExecutionState {
  final List<Question> questions;
  final Map<int, List<int>> userAnswers;
  final Map<int, String> essayAnswers;
  final Map<int, EssayAiEvaluation> aiEvaluations;
  final int correctAnswers;
  final int totalQuestions;
  final double score; // percentage
  final bool isStudyMode;
  final QuizConfig quizConfig;
  final bool wasLimitReached;

  QuizExecutionCompleted({
    required this.questions,
    required this.userAnswers,
    required this.essayAnswers,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.quizConfig,
    required this.score,
    this.wasLimitReached = false,
    Map<int, EssayAiEvaluation>? aiEvaluations,
  }) : isStudyMode = quizConfig.isStudyMode,
       aiEvaluations = aiEvaluations ?? {};

  /// Get details for each question
  List<QuestionResult> get questionResults {
    return questions.asMap().entries.map((entry) {
      final index = entry.key;
      final question = entry.value;
      final userAnswer = userAnswers[index] ?? [];
      final essayAnswer = essayAnswers[index] ?? '';
      final aiEvaluation = aiEvaluations[index];

      final isCorrect = QuizScoringHelper.isAnswerCorrect(
        question,
        userAnswer,
        essayAnswer,
      );

      final isAnswered =
          (userAnswers.containsKey(index) && userAnswers[index]!.isNotEmpty) ||
          essayAnswers[index]?.trim().isNotEmpty == true;

      return QuestionResult(
        question: question,
        userAnswers: userAnswer,
        essayAnswer: essayAnswer,
        correctAnswers: question.correctAnswers,
        isCorrect: isCorrect,
        isAnswered: isAnswered,
        aiEvaluation: aiEvaluation,
      );
    }).toList();
  }
}

/// Class to represent individual question results
class QuestionResult {
  final Question question;
  final List<int> userAnswers;
  final String essayAnswer;
  final List<int> correctAnswers;
  final bool isCorrect;
  final bool isAnswered;
  final EssayAiEvaluation? aiEvaluation;

  QuestionResult({
    required this.question,
    required this.userAnswers,
    required this.essayAnswer,
    required this.correctAnswers,
    required this.isCorrect,
    required this.isAnswered,
    this.aiEvaluation,
  });
}

/// Helper class to store AI evaluation data for essay questions.
class EssayAiEvaluation {
  final String? evaluation;
  final String? errorMessage;

  EssayAiEvaluation({this.evaluation, this.errorMessage});

  bool get hasError => errorMessage != null;
}
