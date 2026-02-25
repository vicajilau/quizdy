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

  /// The order in which questions should be presented.
  final QuestionOrder? questionOrder;

  /// Whether to randomize the order of answers for each question.
  final bool? randomizeAnswers;

  /// Whether to show the count of correct options for multiple-choice questions.
  final bool? showCorrectAnswerCount;

  /// Creates a [QuizConfigStoredSettings] instance.
  const QuizConfigStoredSettings({
    this.questionCount,
    this.isStudyMode,
    this.subtractPoints,
    this.penaltyAmount,
    this.enableMaxIncorrectAnswers,
    this.maxIncorrectAnswers,
    this.questionOrder,
    this.randomizeAnswers,
    this.showCorrectAnswerCount,
  });
}
