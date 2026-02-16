/// A Data Transfer Object (DTO) for storing quiz configuration settings.
///
/// This class encapsulates the user's preferred settings for quiz execution,
/// such as the number of questions and the quiz mode (Study vs. Exam).
class QuizConfigStoredSettings {
  /// The number of questions selected for the quiz.
  final int? questionCount;

  /// Whether the quiz should run in Study Mode (true) or Exam Mode (false).
  final bool? isStudyMode;

  /// Whether to subtract points for incorrect answers.
  final bool? subtractPoints;

  /// The amount of points to subtract for each incorrect answer.
  final double? penaltyAmount;

  /// Whether a limit for incorrect answers is enabled.
  final bool? enableMaxIncorrectAnswers;

  /// The maximum number of incorrect answers allowed before the quiz ends.
  final int? maxIncorrectAnswers;

  /// Creates a [QuizConfigStoredSettings] instance.
  const QuizConfigStoredSettings({
    this.questionCount,
    this.isStudyMode,
    this.subtractPoints,
    this.penaltyAmount,
    this.enableMaxIncorrectAnswers,
    this.maxIncorrectAnswers,
  });
}
