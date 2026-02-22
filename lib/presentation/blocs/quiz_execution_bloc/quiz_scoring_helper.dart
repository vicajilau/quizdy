import 'package:quiz_app/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config.dart';

/// Helper class for quiz scoring calculations.
class QuizScoringHelper {
  /// Checks if a user's answer is correct for a given question.
  ///
  /// Essay questions are always considered "correct" since they require manual grading.
  static bool isAnswerCorrect(
    Question question,
    List<int> userAnswers,
    String essayAnswer, {
    EssayAiEvaluation? aiEvaluation,
  }) {
    if (question.type == QuestionType.essay) {
      if (essayAnswer.trim().isEmpty) return false;
      if (aiEvaluation == null ||
          aiEvaluation.isNotEvaluated ||
          aiEvaluation.isPending) {
        return true; // Assume correct if not evaluated or pending
      }
      if (aiEvaluation.hasError) return false;
      return (aiEvaluation.score ?? 0) >= 50; // Threshold for pass/fail
    }

    final correctAnswers = question.correctAnswers;
    if (correctAnswers.length != userAnswers.length) return false;
    final sortedCorrect = List<int>.from(correctAnswers)..sort();
    final sortedUser = List<int>.from(userAnswers)..sort();
    return sortedCorrect.toString() == sortedUser.toString();
  }

  /// Calculates correct and incorrect answer counts for the given quiz data.
  static QuizResults calculateResults(
    List<Question> questions,
    Map<int, List<int>> userAnswers,
    Map<int, String> essayAnswers,
    QuizConfig quizConfig, {
    Map<int, EssayAiEvaluation>? aiEvaluations,
  }) {
    double correctPoints = 0.0;
    int incorrectCount = 0;
    int unansweredCount = 0;

    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final userAnswer = userAnswers[i] ?? [];
      final essayAnswer = essayAnswers[i] ?? '';

      bool isAnswered = false;
      if (question.type == QuestionType.essay) {
        isAnswered = essayAnswer.trim().isNotEmpty;
      } else {
        isAnswered = userAnswer.isNotEmpty;
      }

      if (isAnswered) {
        if (question.type == QuestionType.essay) {
          final eval = aiEvaluations?[i];
          if (eval != null && eval.isCompleted && eval.score != null) {
            correctPoints += eval.score! / 100.0;
            // For penalty purposes, an essay is only incorrect if it explicitly failed (score < 50)
            if (eval.score! < 50) {
              incorrectCount++;
            }
          } else {
            // Un-evaluated/pending essays count as fully correct temporarily
            correctPoints += 1.0;
          }
        } else {
          if (isAnswerCorrect(question, userAnswer, essayAnswer)) {
            correctPoints += 1.0;
          } else {
            incorrectCount++;
          }
        }
      } else {
        unansweredCount++;
      }
    }

    final List<Question> failedQuestions = [];
    for (int i = 0; i < questions.length; i++) {
      final userAnswer = userAnswers[i] ?? [];
      final essayAnswer = essayAnswers[i] ?? '';
      if (!isAnswerCorrect(
        questions[i],
        userAnswer,
        essayAnswer,
        aiEvaluation: aiEvaluations?[i],
      )) {
        failedQuestions.add(questions[i]);
      }
    }

    final double score = calculateScore(
      correctPoints,
      incorrectCount,
      questions.length,
      quizConfig,
    );

    return QuizResults(
      correctPoints: correctPoints,
      incorrectAnswers: incorrectCount,
      unansweredAnswers: unansweredCount,
      failedQuestions: failedQuestions,
      score: score,
    );
  }

  /// Calculates the final score percentage based on quiz results and config.
  static double calculateScore(
    double correctPoints,
    int incorrectAnswers,
    int totalQuestions,
    QuizConfig quizConfig,
  ) {
    final double penalty =
        (quizConfig.subtractPoints && !quizConfig.isStudyMode)
        ? quizConfig.penaltyAmount
        : 0.0;

    final double netScore = correctPoints - (incorrectAnswers * penalty);
    final double total = totalQuestions.toDouble();
    return total > 0 ? (netScore / total) * 100 : 0.0;
  }
}

/// Holds the results of a quiz scoring calculation.
class QuizResults {
  final double correctPoints;
  final int incorrectAnswers;
  final int unansweredAnswers;
  final List<Question> failedQuestions;
  final double score;

  QuizResults({
    required this.correctPoints,
    required this.incorrectAnswers,
    required this.unansweredAnswers,
    required this.failedQuestions,
    required this.score,
  });
}
