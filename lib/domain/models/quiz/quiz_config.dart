/// Configuration settings for a quiz session.
class QuizConfig {
  /// The total number of questions to be included in the quiz.
  final int questionCount;

  /// Whether the quiz should run in study mode (true) or exam mode (false).
  final bool isStudyMode;

  /// The time limit for the quiz in minutes, if applicable.
  final int? timeLimitMinutes;

  /// Whether a time limit is enabled for the quiz.
  final bool enableTimeLimit;

  /// Whether to subtract points for incorrect answers.
  final bool subtractPoints;

  /// The amount of points to subtract for each incorrect answer.
  final double penaltyAmount;

  /// Whether to use only the user-selected questions instead of a random subset.
  final bool useSelectedOnly;

  /// Whether a limit for incorrect answers is enabled.
  final bool enableMaxIncorrectAnswers;

  /// The maximum number of incorrect answers allowed before the quiz ends.
  final int? maxIncorrectAnswers;

  /// Creates a [QuizConfig] instance with the specified settings.
  const QuizConfig({
    required this.questionCount,
    this.isStudyMode = false,
    this.enableTimeLimit = false,
    this.timeLimitMinutes,
    this.subtractPoints = false,
    this.penaltyAmount = 0.0,
    this.useSelectedOnly = false,
    this.enableMaxIncorrectAnswers = false,
    this.maxIncorrectAnswers,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizConfig &&
        other.questionCount == questionCount &&
        other.isStudyMode == isStudyMode &&
        other.enableTimeLimit == enableTimeLimit &&
        other.timeLimitMinutes == timeLimitMinutes &&
        other.subtractPoints == subtractPoints &&
        other.penaltyAmount == penaltyAmount &&
        other.useSelectedOnly == useSelectedOnly &&
        other.enableMaxIncorrectAnswers == enableMaxIncorrectAnswers &&
        other.maxIncorrectAnswers == maxIncorrectAnswers;
  }

  @override
  int get hashCode =>
      questionCount.hashCode ^
      isStudyMode.hashCode ^
      enableTimeLimit.hashCode ^
      timeLimitMinutes.hashCode ^
      subtractPoints.hashCode ^
      penaltyAmount.hashCode ^
      useSelectedOnly.hashCode ^
      enableMaxIncorrectAnswers.hashCode ^
      maxIncorrectAnswers.hashCode;

  @override
  String toString() =>
      'QuizConfig(questionCount: $questionCount, isStudyMode: $isStudyMode, enableTimeLimit: $enableTimeLimit, timeLimitMinutes: $timeLimitMinutes, subtractPoints: $subtractPoints, penaltyAmount: $penaltyAmount, useSelectedOnly: $useSelectedOnly, enableMaxIncorrectAnswers: $enableMaxIncorrectAnswers, maxIncorrectAnswers: $maxIncorrectAnswers)';
}
