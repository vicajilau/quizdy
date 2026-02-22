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
    String essayAnswer,
  ) {
    if (question.type == QuestionType.essay) {
      return essayAnswer.trim().isNotEmpty;
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
    QuizConfig quizConfig,
  ) {
    int correctCount = 0;
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
        if (isAnswerCorrect(question, userAnswer, essayAnswer)) {
          correctCount++;
        } else {
          incorrectCount++;
        }
      } else {
        unansweredCount++;
      }
    }

    final List<Question> failedQuestions = [];
    for (int i = 0; i < questions.length; i++) {
      final userAnswer = userAnswers[i] ?? [];
      final essayAnswer = essayAnswers[i] ?? '';
      if (!isAnswerCorrect(questions[i], userAnswer, essayAnswer)) {
        failedQuestions.add(questions[i]);
      }
    }

    final double score = calculateScore(
      correctCount,
      incorrectCount,
      questions.length,
      quizConfig,
    );

    return QuizResults(
      correctAnswers: correctCount,
      incorrectAnswers: incorrectCount,
      unansweredAnswers: unansweredCount,
      failedQuestions: failedQuestions,
      score: score,
    );
  }

  /// Calculates the final score percentage based on quiz results and config.
  static double calculateScore(
    int correctAnswers,
    int incorrectAnswers,
    int totalQuestions,
    QuizConfig quizConfig,
  ) {
    final double penalty =
        (quizConfig.subtractPoints && !quizConfig.isStudyMode)
        ? quizConfig.penaltyAmount
        : 0.0;

    final double netScore = correctAnswers - (incorrectAnswers * penalty);
    final double total = totalQuestions.toDouble();
    return total > 0 ? (netScore / total) * 100 : 0.0;
  }
}

/// Holds the results of a quiz scoring calculation.
class QuizResults {
  final int correctAnswers;
  final int incorrectAnswers;
  final int unansweredAnswers;
  final List<Question> failedQuestions;
  final double score;

  QuizResults({
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.unansweredAnswers,
    required this.failedQuestions,
    required this.score,
  });
}
