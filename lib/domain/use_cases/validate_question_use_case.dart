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

import 'package:quizlab_ai/domain/models/custom_exceptions/question_error.dart';
import 'package:quizlab_ai/domain/models/custom_exceptions/question_error_type.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';

class ValidateQuestionUseCase {
  /// Validate a question for a quiz
  static QuestionError validateQuestion(
    String questionText,
    List<String> options,
    List<int> correctAnswers,
    int? questionPosition,
    QuizFile quizFile,
  ) {
    final text = questionText.trim();

    // Validate question text
    if (text.isEmpty) {
      return QuestionError(
        errorType: QuestionErrorType.emptyText,
        param1: questionPosition,
      );
    }

    // Check for duplicate question text
    if (quizFile.questions.any((q) {
      final currentIndex = quizFile.questions.indexOf(q);
      return q.text.trim() == text &&
          (questionPosition == null || currentIndex != questionPosition);
    })) {
      return QuestionError(errorType: QuestionErrorType.duplicatedText);
    }

    // Validate options
    if (options.length < 2) {
      return QuestionError(
        errorType: QuestionErrorType.insufficientOptions,
        param1: text,
      );
    }

    // Check for empty options
    for (int i = 0; i < options.length; i++) {
      if (options[i].trim().isEmpty) {
        return QuestionError(
          errorType: QuestionErrorType.emptyOption,
          param1: i,
          param2: text,
        );
      }
    }

    // Validate correct answers
    if (correctAnswers.isEmpty ||
        correctAnswers.any((index) => index < 0 || index >= options.length)) {
      return QuestionError(
        errorType: QuestionErrorType.invalidCorrectAnswers,
        param1: text,
      );
    }

    return QuestionError.success();
  }
}
