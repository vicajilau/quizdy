// Copyright (C) 2026 Víctor Carreras
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:quizlab_ai/domain/models/quiz/question_order.dart';

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

  /// The order in which questions should be presented.
  final QuestionOrder questionOrder;

  /// Whether to randomize the order of answers for each question.
  final bool randomizeAnswers;

  /// Whether to show the count of correct options for multiple-choice questions.
  final bool showCorrectAnswerCount;

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
    this.questionOrder = QuestionOrder.random,
    this.randomizeAnswers = false,
    this.showCorrectAnswerCount = false,
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
        other.questionOrder == questionOrder &&
        other.randomizeAnswers == randomizeAnswers &&
        other.showCorrectAnswerCount == showCorrectAnswerCount;
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
      maxIncorrectAnswers.hashCode ^
      questionOrder.hashCode ^
      randomizeAnswers.hashCode ^
      showCorrectAnswerCount.hashCode;

  @override
  String toString() =>
      'QuizConfig(questionCount: $questionCount, isStudyMode: $isStudyMode, enableTimeLimit: $enableTimeLimit, timeLimitMinutes: $timeLimitMinutes, subtractPoints: $subtractPoints, penaltyAmount: $penaltyAmount, useSelectedOnly: $useSelectedOnly, enableMaxIncorrectAnswers: $enableMaxIncorrectAnswers, maxIncorrectAnswers: $maxIncorrectAnswers, questionOrder: $questionOrder, randomizeAnswers: $randomizeAnswers, showCorrectAnswerCount: $showCorrectAnswerCount)';
}
