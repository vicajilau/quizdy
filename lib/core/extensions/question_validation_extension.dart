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

import 'package:collection/collection.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';

extension QuestionValidationExtension on Question {
  /// Checks if the provided user answers are correct for this question.
  ///
  /// - [userAnswers]: A list of indices representing the user's selected options.
  ///
  /// Returns `true` if the answers are correct, `false` otherwise.
  /// For Essay questions, this always returns `true` (as they need manual grading,
  /// but we treat them as "complete/correct" for simple status checks usually,
  /// though typically essay correctness is a different concept).
  /// However, for the purpose of "Green/Red" status map, we might want to consider
  /// what "Correct" means for Essay.
  /// Based on `QuizExecutionState._isAnswerCorrect`:
  /// "Essay questions are always considered "correct" since they require manual grading"
  /// So we will follow that logic.
  bool isAnswerCorrect(List<int> userAnswers) {
    if (type == QuestionType.essay) {
      // Essay questions are effectively "always correct" in auto-grading context
      // until manual grading is implemented.
      // But usually we only check if it is ANSWERED.
      // If we are strictly checking "is the answer content correct", for essay it's ambiguous.
      // But if this is used for "Green/Red" map:
      // If answered -> Green? Or just Blue?
      // The user asked for "Green if correct, Red if incorrect".
      // If essay is "always correct", it will be Green if answered.
      return true;
    }

    // For other types, compare correctAnswers with userAnswers
    final sortedCorrect = List<int>.from(correctAnswers)..sort();
    final sortedUser = List<int>.from(userAnswers)..sort();
    return const ListEquality().equals(sortedCorrect, sortedUser);
  }
}
