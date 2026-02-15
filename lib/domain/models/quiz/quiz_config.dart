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

  /// Creates a [QuizConfig] instance with the specified settings.
  const QuizConfig({
    required this.questionCount,
    this.isStudyMode = false,
    this.enableTimeLimit = false,
    this.timeLimitMinutes,
    this.subtractPoints = false,
    this.penaltyAmount = 0.0,
    this.useSelectedOnly = false,
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
        other.useSelectedOnly == useSelectedOnly;
  }

  @override
  int get hashCode =>
      questionCount.hashCode ^
      isStudyMode.hashCode ^
      enableTimeLimit.hashCode ^
      timeLimitMinutes.hashCode ^
      subtractPoints.hashCode ^
      penaltyAmount.hashCode ^
      useSelectedOnly.hashCode;

  @override
  String toString() =>
      'QuizConfig(questionCount: $questionCount, isStudyMode: $isStudyMode, enableTimeLimit: $enableTimeLimit, timeLimitMinutes: $timeLimitMinutes, subtractPoints: $subtractPoints, penaltyAmount: $penaltyAmount, useSelectedOnly: $useSelectedOnly)';
}
